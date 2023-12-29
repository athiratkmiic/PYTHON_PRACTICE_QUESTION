from flask import Flask,render_template,request
import mysql.connector
conn = mysql.connector.connect(
    host = "localhost",
    user ="root",
    password ="root1",
    database = "DETAILS_OF_CANDIDATE")
cursor = conn.cursor()

# Create the flask Application
app=Flask(__name__)

#create a dictionary for login

user_dict={ 'ASW001' : 'asw00' , 'KHA002' : 'kha002' }


# Define a route and corresponding view

@app.route('/')
def Hello():
    #return "Hello World!!!"
    # Call our html Page
    return render_template('index.html')

# Define a route and corresponding view Home page
@app.route('/login')
def home():
    return render_template('home.html')


@app.route('/emp_home', methods=['POST'])
def emp_home():
    username=request.form['username']
    pwd=request.form['password']
    if username not in user_dict:
        return render_template('home.html', msg='Invalid Username')
    elif user_dict[username]!=pwd:
        return render_template('home.html', msg='Invalid Password')
    else:
        return render_template('login.html')

@app.route('/View')
def view():
    query = "SELECT *FROM CandidateList"
    cursor.execute(query)
    data = cursor.fetchall()
    return render_template('view.html',sqldata=data)

@app.route('/Search')
def search():
    return render_template('search.html')

@app.route('/searchresult', methods=['POST'])
def searchresult():
    ename = request.form.get('candname')
    query = "SELECT * FROM CandidateList WHERE cand_name LIKE '%{}%'".format(ename)
    cursor.execute(query)
    data = cursor.fetchall()
    if not data:
        return render_template('search.html',msg= "Employee Not Found")
    else:       
        return render_template('view.html',sqldata = data)
    
@app.route('/Add')
def reg():
    return render_template('add.html')

@app.route('/addcandidate', methods= ['POST'])
def addcandidate():
    cand_id = request.form.get("cand_id")
    cand_name= request.form.get('cand_name')
    cand_mailid= request.form.get('cand_mailid')
    cand_username= request.form.get('cand_username')
    cand_password= request.form.get('cand_password')
    query = "INSERT INTO CandidateList VALUES (%s,%s,%s,%s,%s)"
    data = (cand_id,cand_name,cand_mailid,cand_username,cand_password)
    cursor.execute(query,data)
    conn.commit()
    return render_template('login.html')
    
@app.route('/Add Task')
def add():
    return render_template('addtask.html')

@app.route('/Delete')
def delete():
    return render_template('deletetask.html')

    # Run flask Applicationsss
if __name__=='__main__':
    app.run(debug=True)