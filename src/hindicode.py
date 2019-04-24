import sys
import os

from antlr4 import *

from Config import Config
from HCListener import HCListener
from g4Generated.HindiCodeLexer import HindiCodeLexer
from g4Generated.HindiCodeParser import HindiCodeParser

DEBUG = Config.DEBUG


def main(argv):
    input_file = FileStream(argv[1])
    lexer = HindiCodeLexer(input_file)
    stream = CommonTokenStream(lexer)
    parser = HindiCodeParser(stream)

    tree = parser.hindicode()

    output = open(argv[2], "w", encoding='utf-8')

    hc_writer = HCListener(output)
    walker = ParseTreeWalker()
    walker.walk(hc_writer, tree)

    output.close()

    # Executing generated file
    os.system('python ' + str(argv[2]))


if __name__ == '__main__':
    main(sys.argv)
