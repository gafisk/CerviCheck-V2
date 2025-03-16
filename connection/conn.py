import mysql.connector

# Konfigurasi koneksi ke MySQL
conn = mysql.connector.connect(
    host="localhost",       # Ganti dengan host database, misalnya "127.0.0.1" atau alamat server
    user="root",            # Ganti dengan username MySQL
    password="",  # Ganti dengan password MySQL
    database="db_cervicheck" # Ganti dengan nama database yang ingin diakses
)

# Membuat objek cursor
cursor = conn.cursor()

# Mengeksekusi query
cursor.execute("SHOW TABLES")

# Menampilkan hasil query
for table in cursor:
    print(table)

# Menutup koneksi
cursor.close()
conn.close()