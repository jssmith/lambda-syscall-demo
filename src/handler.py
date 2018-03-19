import os
import subprocess

def lambda_handler(event, context):
    print("hello world!")
    env = os.environ.copy()
    env["LD_LIBRARY_PATH"] = "."
    env["LD_PRELOAD"] = "example.so"
    p = subprocess.Popen(["ls", "-l"], env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    outs, errs = p.communicate(timeout=15)
    print(outs)
    print(errs)
    return "done"
