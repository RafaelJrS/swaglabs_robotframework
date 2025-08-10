import os
import xml.etree.ElementTree as ET
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4
from reportlab.lib.utils import ImageReader
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.platypus import Paragraph


# --- Configurações ---
OUTPUT_DIR = 'resources/libs'
OUTPUT_XML_PATH = 'output.xml'
PDF_OUTPUT_PATH = 'relatorio_de_evidencias.pdf'
# ---------------------

def wrap_text(c, text, x, y, max_width, style):
    """Função para quebrar o texto em várias linhas se for muito longo."""
    p = Paragraph(text, style)
    p_width, p_height = p.wrapOn(c, max_width, y)
    p.drawOn(c, x, y - p_height)
    return p_height

def gerar_pdf():
    print("Iniciando a geração do PDF de evidências a partir dos logs...")

    if not os.path.exists(OUTPUT_XML_PATH):
      print(f"ERRO: Arquivo '{OUTPUT_XML_PATH}' não encontrado. Execute os testes do Robot primeiro.")
      return

    # Parseia o arquivo de resultado do Robot
    tree = ET.parse(OUTPUT_XML_PATH)
    root = tree.getroot()

    c = canvas.Canvas(PDF_OUTPUT_PATH, pagesize=A4)
    width, height = A4
    styles = getSampleStyleSheet()
    style_normal = styles['Normal']
    style_bold = styles['h4']

    y_position = height - 40
    step_counter = 0

    # Itera sobre todos os testes e suas keywords (passos)
    for test in root.findall('.//test'):
        test_name = test.get('name')

        # Adiciona o nome do Test Case no PDF
        y_position -= wrap_text(c, f"Caso de Teste: {test_name}", 40, y_position, width - 80, style_bold)
        y_position -= 20

        # <<< MUDANÇA PRINCIPAL: Busca simplificada para todos os logs de 'INFO' >>>
        for msg in test.findall(".//msg[@level='INFO']"):
            # <<< MUDANÇA PRINCIPAL: Filtro feito com Python, que é mais robusto >>>
            if msg.text and msg.text.startswith('EVIDENCIA:'):
                try:
                    # Extrai as informações da mensagem: "EVIDENCIA: Nome do Passo | Caminho/da/Imagem.png"
                    _, data = msg.text.split(':', 1)
                    step_name, screenshot_path = [item.strip() for item in data.split('|', 1)]
                except ValueError:
                    # Pula para a próxima mensagem se o formato for inválido
                    continue

                # Verifica se o arquivo de screenshot realmente existe
                if os.path.exists(screenshot_path):
                    step_counter += 1
                    full_step_name = f"<b>Passo {step_counter}: {step_name}</b>"



                    # --- Lógica para desenhar no PDF (continua a mesma) ---
                    img = ImageReader(screenshot_path)
                    img_width, img_height = img.getSize()
                    aspect = img_height / float(img_width)
                    display_width = width - 100
                    img_height_display = display_width * aspect

                    text_height_estimate = len(full_step_name) / 100 * 20

                    if y_position < (img_height_display + text_height_estimate + 50):
                        c.showPage()
                        y_position = height - 40

                    text_height_actual = wrap_text(c, full_step_name, 50, y_position, width - 100, style_normal)
                    y_position -= (text_height_actual + 10)

                    c.drawImage(screenshot_path, 50, y_position - img_height_display, width=display_width, height=img_height_display, preserveAspectRatio=True, anchor='n')
                    y_position -= (img_height_display + 25)

    # Só salva o arquivo se pelo menos um passo com evidência foi encontrado
    if step_counter > 0:
        c.save()
        print(f"✅ PDF '{PDF_OUTPUT_PATH}' gerado com sucesso com {step_counter} passo(s) de negócio.")
    else:
        print("⚠️ Nenhuma evidência com o log 'EVIDENCIA:' foi encontrada para gerar o PDF.")

if __name__ == '__main__':
    gerar_pdf()