#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Generate professional CV PDF for Adriana Pommot."""

from reportlab.lib.pagesizes import A4
from reportlab.lib.units import mm
from reportlab.lib.colors import HexColor
from reportlab.pdfgen import canvas
from reportlab.platypus import Paragraph
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
import os

# Register a Unicode-capable font
# Use Helvetica Neue if available, otherwise fallback
FONT = "Helvetica"
FONT_BOLD = "Helvetica-Bold"

# Colors
BLACK = HexColor("#111111")
GRAY1 = HexColor("#37342F")
GRAY2 = HexColor("#585550")
GRAY3 = HexColor("#8A857D")
GRAY4 = HexColor("#B8B2A8")
GRAY5 = HexColor("#EBE7E1")
ACCENT = HexColor("#D1F466")

OUTPUT = "/Users/mac/Downloads/portfolio-deploy/cv-adriana-pommot.pdf"


def draw_cv():
    c = canvas.Canvas(OUTPUT, pagesize=A4)
    w, h = A4

    ml = 28 * mm
    mr = 28 * mm
    content_w = w - ml - mr

    sidebar_w = 58 * mm
    main_w = content_w - sidebar_w - 8 * mm
    sidebar_x = w - mr - sidebar_w

    y = h - 22 * mm

    # ═══ Styles ═══
    style_body = ParagraphStyle(
        'body', fontName=FONT, fontSize=8, leading=12, textColor=GRAY2,
        encoding='utf-8',
    )
    style_exp_title = ParagraphStyle(
        'exp_title', fontName=FONT_BOLD, fontSize=8, leading=10, textColor=BLACK,
        encoding='utf-8',
    )
    style_bullet = ParagraphStyle(
        'bullet', fontName=FONT, fontSize=7.5, leading=10.5, textColor=GRAY2,
        leftIndent=8, firstLineIndent=-8, encoding='utf-8',
    )
    style_skill = ParagraphStyle(
        'skill', fontName=FONT, fontSize=7.5, leading=10.5, textColor=GRAY2,
        encoding='utf-8',
    )
    style_skill_label = ParagraphStyle(
        'skill_label', fontName=FONT_BOLD, fontSize=7.5, leading=10, textColor=GRAY1,
        encoding='utf-8',
    )
    style_edu_title = ParagraphStyle(
        'edu_title', fontName=FONT_BOLD, fontSize=7.5, leading=10, textColor=GRAY1,
        encoding='utf-8',
    )
    style_edu_detail = ParagraphStyle(
        'edu_detail', fontName=FONT, fontSize=7, leading=9.5, textColor=GRAY3,
        encoding='utf-8',
    )

    # ═══ HEADER ═══
    c.setFont(FONT_BOLD, 28)
    c.setFillColor(BLACK)
    c.drawString(ml, y, "ADRIANA")
    y -= 10 * mm
    c.drawString(ml, y, "POMMOT")
    y -= 8 * mm

    c.setFont(FONT, 9)
    c.setFillColor(GRAY2)
    c.drawString(ml, y, u"Designer S\u00eanior  \u00b7  Design Digital & Intelig\u00eancia Visual")
    y -= 6 * mm

    # Accent line
    c.setStrokeColor(ACCENT)
    c.setLineWidth(2.5)
    c.line(ml, y, ml + 40 * mm, y)
    y -= 5 * mm

    # Contact
    c.setFont(FONT, 7.5)
    c.setFillColor(GRAY3)
    c.drawString(ml, y, u"adrianapommot@gmail.com  |  11 96 272 48 79  |  S\u00e3o Paulo, SP \u00b7 Remoto")
    y -= 4 * mm
    c.setFillColor(GRAY2)
    c.drawString(ml, y, "linkedin.com/in/adriana-pommot  |  adrianapommot.github.io/portfolio/")
    y -= 8 * mm

    # Divider
    c.setStrokeColor(GRAY5)
    c.setLineWidth(0.5)
    c.line(ml, y, w - mr, y)
    y -= 7 * mm

    # ═══ RESUMO ═══
    def section_title(label, ypos, xpos=ml):
        c.setFont(FONT_BOLD, 8)
        c.setFillColor(BLACK)
        c.drawString(xpos, ypos, label.upper())
        ypos -= 2 * mm
        c.setStrokeColor(ACCENT)
        c.setLineWidth(1.5)
        title_w = c.stringWidth(label.upper(), FONT_BOLD, 8) + 2 * mm
        c.line(xpos, ypos, xpos + title_w, ypos)
        return ypos - 5 * mm

    y = section_title(u"Resumo Profissional", y)

    resumo = (
        u"Designer com mais de 16 anos de experi\u00eancia em design digital, sistemas de design "
        u"e identidade visual de produto. Atuei em empresas como Escale, Dasa, Accenture, MRV "
        u"e consultorias, sempre com foco em execu\u00e7\u00e3o de alta qualidade: interfaces de alta "
        u"fidelidade, design systems escal\u00e1veis e dire\u00e7\u00e3o de arte aplicada ao digital. "
        u"Minha for\u00e7a est\u00e1 no craft visual e na capacidade de transformar complexidade em clareza. "
        u"Dispon\u00edvel para trabalho remoto."
    )

    p = Paragraph(resumo, style_body)
    pw, ph = p.wrap(content_w, 200)
    p.drawOn(c, ml, y - ph)
    y -= ph + 7 * mm

    # Divider
    c.setStrokeColor(GRAY5)
    c.setLineWidth(0.5)
    c.line(ml, y, w - mr, y)
    y -= 7 * mm

    # ═══ TWO COLUMNS ═══
    two_col_y = y

    # --- LEFT: Experience ---
    y = section_title(u"Experi\u00eancia Profissional", y)

    experiences = [
        {
            "period": u"2023 \u2013 Presente",
            "company": u"Freelance \u00b7 Projetos Independentes",
            "role": "Designer Digital",
            "bullets": [
                u"Design digital, identidade visual e ilustra\u00e7\u00e3o para projetos independentes",
                u"Desenvolvimento de arte ornamental e linguagem autoral (@ultraviolenta.ink)",
            ]
        },
        {
            "period": u"Abr 2021 \u2013 2023",
            "company": "Escale",
            "role": "Design Ops",
            "bullets": [
                u"Cria\u00e7\u00e3o e manuten\u00e7\u00e3o do Delta Design System: tokens, bibliotecas e documenta\u00e7\u00e3o",
                u"Governan\u00e7a visual entre 20+ produtos digitais em 3 segmentos (sa\u00fade, telecom, finan\u00e7as)",
                u"Estrutura\u00e7\u00e3o da Guilda de Design e defini\u00e7\u00e3o de padr\u00f5es visuais para escala",
            ]
        },
        {
            "period": u"Nov 2020 \u2013 Abr 2021",
            "company": "Dasa",
            "role": u"Product Designer S\u00eanior",
            "bullets": [
                u"Design de interfaces cl\u00ednicas e prototipa\u00e7\u00e3o de alta fidelidade para produtos m\u00e9dicos",
                u"Constru\u00e7\u00e3o da identidade visual digital da marca Dasa aplicada aos produtos internos",
                u"Cria\u00e7\u00e3o de sistema de \u00edcones que se tornou refer\u00eancia entre produtos",
            ]
        },
        {
            "period": u"Fev 2019 \u2013 Out 2020",
            "company": "Accenture / Ford",
            "role": u"Product Designer S\u00eanior",
            "bullets": [
                u"Design visual completo para Immersion Room automotivo Ford (projeto B460/KX738)",
                u"Cria\u00e7\u00e3o de cen\u00e1rios, \u00edcones e motion design para experi\u00eancia imersiva",
            ]
        },
        {
            "period": u"Set 2017 \u2013 Jan 2019",
            "company": u"D3 (consultoria) \u00b7 Cliente MRV",
            "role": u"UI Designer S\u00eanior",
            "bullets": [
                u"Redesign do autoatendimento financeiro da MRV (2,5M clientes)",
                u"UI e microintera\u00e7\u00f5es para fluxo de renegocia\u00e7\u00e3o com 27% de engajamento e 14% de convers\u00e3o no piloto",
            ]
        },
        {
            "period": u"2012 \u2013 2017",
            "company": u"Ag\u00eancias & Freelance",
            "role": "Designer & Motion Designer",
            "bullets": [
                u"Stayfilm, Ortiz Gaming, agMint, Papanapa, Questto|N\u00f3, SmartMEI",
                u"Design digital, motion design, dire\u00e7\u00e3o de arte e ilustra\u00e7\u00e3o",
            ]
        },
    ]

    for exp in experiences:
        c.setFont(FONT, 7)
        c.setFillColor(GRAY4)
        c.drawString(ml, y, exp["period"])
        y -= 4 * mm

        p = Paragraph(u"<b>{}</b>  \u2014  {}".format(exp["company"], exp["role"]), style_exp_title)
        pw, ph = p.wrap(main_w, 200)
        p.drawOn(c, ml, y - ph)
        y -= ph + 1.5 * mm

        for bullet in exp["bullets"]:
            bp = Paragraph(u"\u00b7  " + bullet, style_bullet)
            bw, bh = bp.wrap(main_w, 200)
            bp.drawOn(c, ml, y - bh)
            y -= bh + 0.5 * mm

        y -= 3 * mm

    # --- RIGHT: Skills + Education ---
    sy = two_col_y
    sy = section_title(u"Habilidades T\u00e9cnicas", sy, sidebar_x)

    skills = [
        ("Design Systems", u"Tokens, bibliotecas, documenta\u00e7\u00e3o e governan\u00e7a"),
        ("UI Design", u"Interfaces de alta fidelidade, prototipa\u00e7\u00e3o, acessibilidade, mobile-first"),
        ("Ferramentas", "Figma, Adobe CC (Illustrator, Photoshop, After Effects, Lightroom), Procreate"),
        (u"Documenta\u00e7\u00e3o", u"Storybook, handoff t\u00e9cnico para devs"),
        (u"Dire\u00e7\u00e3o de Arte", "Branding e identidade visual de produto"),
        (u"Ilustra\u00e7\u00e3o & Motion", u"Ilustra\u00e7\u00e3o autoral e motion design"),
    ]

    for label, desc in skills:
        p = Paragraph(label, style_skill_label)
        pw, ph = p.wrap(sidebar_w, 200)
        p.drawOn(c, sidebar_x, sy - ph)
        sy -= ph + 0.5 * mm

        p = Paragraph(desc, style_skill)
        pw, ph = p.wrap(sidebar_w, 200)
        p.drawOn(c, sidebar_x, sy - ph)
        sy -= ph + 4 * mm

    # Education
    sy -= 3 * mm
    sy = section_title(u"Educa\u00e7\u00e3o", sy, sidebar_x)

    education = [
        (u"P\u00f3s-gradua\u00e7\u00e3o \u2013 Design Gr\u00e1fico", u"Miami Ad School Brasil \u00b7 2015\u20132017"),
        (u"Gradua\u00e7\u00e3o \u2013 Design Gr\u00e1fico", u"Belas Artes de S\u00e3o Paulo \u00b7 2007\u20132010"),
        ("Pintura Digital", u"Faculdade M\u00e9li\u00e8s \u00b7 2011"),
        ("UX Design", u"Tera \u00b7 2019"),
    ]

    for title, detail in education:
        p = Paragraph(title, style_edu_title)
        pw, ph = p.wrap(sidebar_w, 200)
        p.drawOn(c, sidebar_x, sy - ph)
        sy -= ph + 1 * mm

        p = Paragraph(detail, style_edu_detail)
        pw, ph = p.wrap(sidebar_w, 200)
        p.drawOn(c, sidebar_x, sy - ph)
        sy -= ph + 4 * mm

    # Skills tags
    sy -= 3 * mm
    sy = section_title("Skills", sy, sidebar_x)

    tags = [
        u"Ilustra\u00e7\u00e3o", "Design Digital", u"Dire\u00e7\u00e3o de Arte",
        "Motion Design", "Visual Design", "Digital Art"
    ]

    for tag in tags:
        p = Paragraph(tag, style_skill)
        pw, ph = p.wrap(sidebar_w, 200)
        p.drawOn(c, sidebar_x, sy - ph)
        sy -= ph + 1.5 * mm

    c.save()
    print(f"CV saved to {OUTPUT}")


if __name__ == "__main__":
    draw_cv()
