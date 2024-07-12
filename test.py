import pdftotext

def convert_pdf_to_txt(pdf_path, txt_path):
    with open(pdf_path, 'rb') as pdf_file:
        pdf = pdftotext.PDF(pdf_file)
        with open(txt_path, 'w') as txt_file:
            txt_file.write("\n\n".join(pdf))

pdf_path = 'hello.pdf'
txt_path = 'kos.txt'
convert_pdf_to_txt(pdf_path, txt_path)