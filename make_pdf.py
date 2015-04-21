#!/usr/bin/env python
import pdfkit
from jinja2 import Environment, FileSystemLoader
import re


def convertHtmlToPdf(html, pdf_filename,
                     temp_html_filename=None):
    """
    Convert <html> into a pdf file and store it in <pdf_filename>.
    Also creates a html file and stores it in <temp_html_filename>
    """
    if not temp_html_filename:
        m = re.match(r'.*?([^/]+)\.pdf', pdf_filename)
        if m:
            temp_html_filename = '~' + m.group(1) + '.html'
        else:
            temp_html_filename = "./~htmltopdf.html"

    # write out html
    with open(temp_html_filename, "wb") as html_file_out:
        html_file_out.write(html)

    options = {'dpi': 150,
               'margin-left': 10,
               'margin-right': 10,
               'margin-top': 10,
               'margin-bottom': 10}
    pdfkit.from_file(temp_html_filename, pdf_filename, options=options)


def renderHtmlFromMarkdownTemplate(markdown_filename,
                                   template_filename,
                                   template_dir="./templates"):
    import markdown2 as md2
    env = Environment(loader=FileSystemLoader(template_dir))
    template = env.get_template(template_filename)
    with open(markdown_filename) as f:
        return template.render(content=md2.markdown(f.read()))


def renderHtmlFromTemplate(html_filename,
                           template_filename,
                           template_dir="./templates"):
    env = Environment(loader=FileSystemLoader(template_dir))
    template = env.get_template(template_filename)
    with open(html_filename) as f:
        return template.render(content=f.read())

if __name__ == '__main__':
    html = renderHtmlFromTemplate(html_filename="./_includes/resume.html",
                                  template_filename="./pdf_template.html")
    convertHtmlToPdf(html, pdf_filename="./Anush_Mohan_resume.pdf")
