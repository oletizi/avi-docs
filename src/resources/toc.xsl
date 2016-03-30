<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://wkhtmltopdf.org/outline"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                indent="yes"/>
    <xsl:variable name="docversion" select="'16.1'"/>
    <xsl:variable name="docname" select="'Avi Vantage Configuration Guide'"/>
    <xsl:template match="outline:outline">
        <html>
            <head>
                <title><xsl:value-of select="$docname"/> v<xsl:value-of select="$docversion"/></title>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <style>
                    h1 {
                    text-align: center;
                    font-size: 36pt;
                    font-family: arial;
                    padding-top: 200px;
                    }
                    div.description {
                      text-align: center;
                      border: none;
                      margin-bottom: 700px;
                      font-family: arial, sans-serif;
                      font-size: 12pt;
                    }

                    div {border-bottom: 1px dashed rgb(200,200,200);}
                    span {float: right;}
                    li {list-style: none;}
                    ul {
                    font-size: 12pt;
                    font-family: arial;
                    }
                    ul ul {font-size: 80%; }
                    ul {
                      margin-top: 10px;
                      padding-left: 0em;
                    }
                    ul ul {padding-left: 1em;}
                    a {text-decoration:none; color: black;}
                </style>
            </head>
            <body>
                <h1>Avi Vantage Configuration Guide v16.1</h1>
                <div class="description">Copyright (c) 2016 Avi Networks</div>
                <div style="font-family: arial, sans-serif; font-size: 20pt; margin-bottom: 20pt">Table of Contents</div>
                <ul>
                    <xsl:apply-templates select="outline:item/outline:item"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="outline:item">
        <xsl:if test="@title!='Avi Vantage Configuration Guide v16.1'">
            <xsl:if test="count(ancestor::*) &lt; 4">
                <li>
                    <xsl:if test="@title!=''">
                        <div>
                            <a>
                                <xsl:if test="@link">
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@link"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@backLink">
                                    <xsl:attribute name="name">
                                        <xsl:value-of select="@backLink"/>
                                    </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="@title"/>
                            </a>
                            <span>
                                <xsl:value-of select="@page"/>
                            </span>
                        </div>
                    </xsl:if>
                    <ul>
                        <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
                        <xsl:apply-templates select="outline:item"/>
                    </ul>
                </li>
            </xsl:if>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>