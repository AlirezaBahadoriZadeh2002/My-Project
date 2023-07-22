from flask import Flask , redirect
import subprocess
import threading



app = Flask(__name__)



@app.route('/')
def info():
    return """
    <h1>Welcome to My Application</h1>
    <p><h4>Main Page</h4>&nbsp;/</p>
    <p><h4>Image</h4>&nbsp;/image</p>
    <p><h4>Consul</h4>&nbsp;/ui/consul</p>
    <p><h4>Information</h4>&nbsp;/info</p>
    """







@app.route('/restart')
def nginx_restart():
    def restart():
        subprocess.call(['service', 'nginx', 'restart'])


    test_thread = threading.Thread(target=restart)
    test_thread.start()
    return "Nginx Restart \n"





if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)




