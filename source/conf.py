# -*- coding: utf-8 -*-
import sys, os
from datetime import datetime

project = 'Axon.ivy Digital Business Platform'
copyright = str(datetime.today().year) + ', AXON Ivy AG'
execfile('../target/version.py')

# general options
needs_sphinx = '1.5.6'
master_doc = 'index'
pygments_style = 'tango'
add_function_parentheses = True

extensions = [
    'sphinx.ext.extlinks',
    'sphinxprettysearchresults'
]


templates_path = ['_templates']
exclude_trees = []
source_suffix = ['.rst']
source_encoding = 'utf-8-sig'

# html options
html_theme = 'sphinx_rtd_theme'
html_use_index = True
html_show_sourcelink = False
html_static_path = ['_static']
html_logo = '_static/images/axonivylogo.png'
html_theme_options = {
    'logo_only': True
}

# base urls
# https://stackoverflow.com/questions/1227037/substitutions-inside-links-in-rest-sphinx
extlinks = {
    'dev-url':  ('https://developer.axonivy.com%s', None),
    'public-api':  ('https://developer.axonivy.com/doc/latest/PublicAPI%s', None),
}

# token replacements
# https://github.com/sphinx-doc/sphinx/issues/4054
replacements = {
    '|ivy-platform|': 'Axon.ivy Digital Business Platform',
    '|ivy-engine|' : 'Axon.ivy Engine',
    '|ivy-designer|': 'Axon.ivy Designer',
    '|axon-ivy|': 'Axon.ivy',
}

def replaceToken(app, docname, source):
    result = source[0]
    for key in app.config.replacements:
        result = result.replace(key, app.config.replacements[key])
    source[0] = result

def setup(app):
    app.add_config_value('replacements', {}, True)
    app.connect('source-read', replaceToken)
