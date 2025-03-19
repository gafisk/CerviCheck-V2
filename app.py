from flask import Flask, render_template, request, redirect, url_for, session, flash, send_file
from connections.conn import get_db_connection 
import joblib
import numpy as np
import datetime
import pandas


app = Flask(__name__)
app.secret_key = 'CerviCheck_Indah_rhs2025-GafDev' 

# Load model
model = joblib.load("model/svm_model.pkl")
model_full = joblib.load("model/nb_model.pkl")

# Index Application
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/classification', methods=['GET', 'POST'])
def classification():
    input_initial = ['inisial', 'umur', 'alamat', 'pekerjaan', 'pendidikan']
    input_names = ['d21', 'd11', 'b62', 'b21', 'b61', 'b12', 'd92', 'd26',
                    'b14', 'd23', 'b24', 'd117', 'b52', 'b15', 'd118', 'b11',
                    'd25', 'd91', 'b23', 'b44', 'b42', 'b22', 'd116', 'd51',
                    'b43', 'd52', 'd22', 'b25', 'b53']
    
    # Pemisahan kolom berdasarkan tabel
    columns_d = ['d21', 'd11', 'd92', 'd26', 'd23', 
                 'd117', 'd118', 'd25', 'd91', 'd116', 
                 'd51', 'd52', 'd22']
    columns_b = ['b62', 'b21', 'b61', 'b12', 'b14', 'b24', 
                 'b52', 'b15', 'b11', 'b23', 'b44', 'b42', 
                 'b22', 'b43', 'b25', 'b53']
    columns_c = []

    form_values_classification = {}
    prediction_label = None
    error = None

    if request.method == 'POST':
        try:
            conn = get_db_connection()
            cursor = conn.cursor()

            # Ambil data dari form
            form_values_initial = {name: request.form.get(name, '').strip() for name in input_initial}
            form_values_classification = {name: request.form.get(name, '').strip() for name in input_names}

            # Validasi input kosong
            if any(value == '' for value in form_values_initial.values()) or \
               any(value == '' for value in form_values_classification.values()):
                error = "Semua Form Isian Harus Diisi"
            else:
                # Konversi data untuk prediksi
                input_data = np.array([float(value) for value in form_values_classification.values()]).reshape(1, -1)
                prediction = model.predict(input_data)[0]

                # Mapping hasil prediksi ke label risiko
                risk_mapping = {1: 'Risiko Rendah', 2: 'Risiko Sedang', 3: 'Risiko Tinggi'}
                prediction_label = risk_mapping.get(prediction, "Tidak Diketahui")

                # Simpan ke data_responden
                insert_responden_query = """
                    INSERT INTO data_responden (nama, umur, alamat, pekerjaan, pendidikan, waktu, status)
                    VALUES (%s, %s, %s, %s, %s, %s, %s);
                """
                waktu_sekarang = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                cursor.execute(insert_responden_query, (*form_values_initial.values(), waktu_sekarang, prediction_label))

                # Ambil id_responden yang baru
                cursor.execute("SELECT LAST_INSERT_ID();")
                new_responden_id = cursor.fetchone()[0]
                conn.commit()

                # Simpan ke tabel yang sesuai
                def insert_into_table(table_name, columns):
                    if table_name == 'f_class_c' and not columns:
                        cursor.execute("SHOW COLUMNS FROM f_class_c")
                        all_columns = [row[0] for row in cursor.fetchall() if row[0] not in ['id_f_class_c', 'id_responden']]
                        values = ['-' for _ in all_columns]
                        columns = all_columns
                    elif not columns:
                        return
                    else:
                        values = [form_values_classification.get(col, '-') for col in columns]

                    query = f"""
                        INSERT INTO {table_name} (id_responden, {', '.join(columns)})
                        VALUES ({', '.join(['%s'] * (len(columns) + 1))});
                    """
                    cursor.execute(query, (new_responden_id, *values))
                    conn.commit()

                insert_into_table('f_class_d', columns_d)
                insert_into_table('f_class_b', columns_b)
                insert_into_table('f_class_c', columns_c)

            cursor.close()
            conn.close()

        except Exception as e:
            conn.rollback()
            error = f"Terjadi kesalahan: {str(e)}"

    return render_template('classification.html', form_values=form_values_classification, prediction=prediction_label, error=error)

@app.route('/full_classification', methods=['GET', 'POST'])
def full_classification():
    input_initial = ['inisial', 'umur', 'alamat', 'pekerjaan', 'pendidikan']
    input_names = ['b11', 'b12', 'b13', 'b14', 'b15',
                   'b21', 'b22', 'b23', 'b24', 'b25',
                   'b31', 'b32', 'b33', 'b34', 'b35', 'b36',
                   'b41', 'b42', 'b43', 'b44', 'b45', 'b46',
                   'b51', 'b52', 'b53', 'b54', 'b55', 'b56', 'b57', 'b58', 'b59', 'b510', 'b511', 
                   'b61', 'b62', 'b63', 'b64', 
                   'c11', 'c12', 'c13', 'c14', 'c15', 
                   'c21', 'c22', 'c23', 'c24', 'c25', 
                   'c31', 'c32', 'c33', 'c34', 'c35', 
                   'c41', 'c42', 'c43', 'c44', 
                   'c51', 'c52', 'c53', 'c54', 
                   'c61', 'c62', 'c63', 
                   'd11', 'd12', 'd13', 
                   'd21', 'd22', 'd23', 'd24', 'd25', 'd26', 'd27', 'd28', 
                   'd31', 'd32', 'd33', 'd34', 'd35', 'd36', 'd37', 'd38', 'd39', 'd310', 'd311', 'd312', 'd313', 'd314', 'd315', 'd316', 'd317', 'd318', 'd319', 'd320', 'd321', 'd322', 'd323', 
                   'd41', 'd42', 'd43', 'd44', 'd45', 'd46', 
                   'd51', 'd52', 'd53', 'd54', 'd55', 
                   'd61', 'd62', 'd63', 'd64', 'd65', 'd66', 'd67', 'd68', 
                   'd71', 'd72', 'd73', 'd74', 'd75', 'd76', 'd77', 
                   'd81', 'd82', 'd83', 'd84', 'd85', 'd86', 
                   'd91', 'd92', 'd93', 'd94', 'd95',
                   'd101', 'd102', 'd103', 'd104', 
                   'd111', 'd112', 'd113', 'd114', 'd115', 'd116', 'd117', 'd118', 'd119', 
                   'd121', 'd122', 'd123', 'd124', 
                   'd131', 'd132', 'd133', 'd134']
    
    # Pemisahan kolom berdasarkan tabel
    columns_d = [col for col in input_names if col.startswith('d')]
    columns_b = [col for col in input_names if col.startswith('b')]
    columns_c = [col for col in input_names if col.startswith('c')]
    
    form_values_classification = {}
    prediction_label = None
    error = None

    if request.method == 'POST':
        try:
            conn = get_db_connection()
            cursor = conn.cursor()
            
            # Ambil data dari form
            form_values_initial = {name: request.form.get(name, '').strip() for name in input_initial}
            form_values_classification = {name: request.form.get(name, '').strip() for name in input_names}

            # Validasi input kosong
            if any(value == '' for value in form_values_initial.values()) or \
               any(value == '' for value in form_values_classification.values()):
                error = "Semua Form Isian Harus Diisi"
            else:
                # Konversi data untuk prediksi
                input_data = np.array([float(value) for value in form_values_classification.values()]).reshape(1, -1)
                prediction = model_full.predict(input_data)[0]
                
                # Mapping hasil prediksi ke label risiko
                risk_mapping = {1: 'Risiko Rendah', 2: 'Risiko Sedang', 3: 'Risiko Tinggi'}
                prediction_label = risk_mapping.get(prediction, "Tidak Diketahui")
                
                # Simpan ke data_responden
                insert_responden_query = """
                    INSERT INTO data_responden (nama, umur, alamat, pekerjaan, pendidikan, waktu, status)
                    VALUES (%s, %s, %s, %s, %s, %s, %s);
                """
                waktu_sekarang = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
                cursor.execute(insert_responden_query, (*form_values_initial.values(), waktu_sekarang, prediction_label))
                
                # Ambil id_responden yang baru
                cursor.execute("SELECT LAST_INSERT_ID();")
                new_responden_id = cursor.fetchone()[0]
                conn.commit()

                # Simpan ke tabel yang sesuai
                def insert_into_table(table_name, columns):
                    if table_name == 'f_class_c' and not columns:
                        cursor.execute("SHOW COLUMNS FROM f_class_c")
                        all_columns = [row[0] for row in cursor.fetchall() if row[0] not in ['id_f_class_c', 'id_responden']]
                        values = ['-' for _ in all_columns]
                        columns = all_columns
                    elif not columns:
                        return
                    else:
                        values = [form_values_classification.get(col, '-') for col in columns]

                    query = f"""
                        INSERT INTO {table_name} (id_responden, {', '.join(columns)})
                        VALUES ({', '.join(['%s'] * (len(columns) + 1))});
                    """
                    cursor.execute(query, (new_responden_id, *values))
                    conn.commit()
                
                insert_into_table('f_class_d', columns_d)
                insert_into_table('f_class_b', columns_b)
                insert_into_table('f_class_c', columns_c)
            
            cursor.close()
            conn.close()

        except Exception as e:
            conn.rollback()
            error = f"Terjadi kesalahan: {str(e)}"

    return render_template('full_classification.html', form_values=form_values_classification, prediction=prediction_label, error=error)

# Bagian Admin
@app.route('/administrator')
def administrator():
    if 'user' not in session:
        flash("Silakan login terlebih dahulu!", "warning")
        return redirect(url_for('login'))
    
    conn = get_db_connection()
    cursor = conn.cursor()
    
    cursor.execute("SELECT COUNT(*) FROM data_responden")
    total_responden = cursor.fetchone()[0]
    
    cursor.execute("SELECT COUNT(*) FROM data_responden WHERE status='Risiko Rendah'")
    risiko_rendah = cursor.fetchone()[0]
    
    cursor.execute("SELECT COUNT(*) FROM data_responden WHERE status='Risiko Sedang'")
    risiko_sedang = cursor.fetchone()[0]
    
    cursor.execute("SELECT COUNT(*) FROM data_responden WHERE status='Risiko Tinggi'")
    risiko_tinggi = cursor.fetchone()[0]
    
    cursor.close()
    conn.close()
    
    return render_template('admin/dashboard.html', total_responden=total_responden, risiko_rendah=risiko_rendah, risiko_sedang=risiko_sedang, risiko_tinggi=risiko_tinggi)

@app.route('/dataresponden')
def dataresponden():
    if 'user' not in session:
        flash("Silakan login terlebih dahulu!", "warning")
        return redirect(url_for('login'))
    conn = get_db_connection()  # Ambil koneksi baru
    cursor = conn.cursor(dictionary=True)  # Menggunakan dictionary agar lebih mudah
    cursor.execute("SELECT * FROM data_responden")
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return render_template('admin/dataresponden.html', data=data)

@app.route('/hapus_responden/<int:id_responden>')
def hapus_responden(id_responden):
    if 'user' not in session:
        flash("Silakan login terlebih dahulu!", "warning")
        return redirect(url_for('login'))
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM data_responden WHERE id_responden = %s", (id_responden,))
        conn.commit()
        flash("Responden berhasil dihapus!", "success")

    except Exception as e:
        conn.rollback()
        flash(f"Terjadi kesalahan: {str(e)}", "danger")
    finally:
        cursor.close()
        conn.close()

    return redirect(url_for('dataresponden'))

import pandas as pd
from flask import send_file

@app.route('/export_data')
def export_data():
    if 'user' not in session:
        flash("Silakan login terlebih dahulu!", "warning")
        return redirect(url_for('login'))

    conn = get_db_connection()
    
    query = """
    SELECT 
        r.waktu, r.nama, r.umur, r.alamat, r.pekerjaan, r.pendidikan,
        b.*, c.*, d.*,
        r.status
    FROM data_responden r
    LEFT JOIN f_class_b b ON r.id_responden = b.id_responden
    LEFT JOIN f_class_c c ON r.id_responden = c.id_responden
    LEFT JOIN f_class_d d ON r.id_responden = d.id_responden;
    """

    df = pd.read_sql(query, conn)
    conn.close()

    # Simpan ke file Excel
    df = df.drop(columns=['id_responden', 'id_f_class_b', 'id_f_class_c', 'id_f_class_d'], errors='ignore')
    file_path = "exported_data.xlsx"
    df.to_excel(file_path, index=False, engine='openpyxl')

    return send_file(file_path, as_attachment=True)



# Function Login and Logout
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        # Cek username dan password di database
        cursor.execute("SELECT * FROM user WHERE username = %s AND password = %s", (username, password))
        user = cursor.fetchone()

        cursor.close()
        conn.close()

        if user:
            session['user'] = user['username']  # Simpan user di session
            flash("Login berhasil!", "success")
            return redirect(url_for('administrator'))
        else:
            flash("Username atau password salah!", "danger")

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
