from Config import Config


class Logger:
    DEBUG = Config.DEBUG

    @classmethod
    def logger(cls, output=None, log_text="No Log Text Provided"):
        if output is not None:
            if cls.DEBUG:
                output.write("\n# " + log_text + "\n")
