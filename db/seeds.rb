# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Lembaga.destroy_all
Periode.destroy_all
Tahun.destroy_all
Opd.destroy_all
User.destroy_all
Profile.destroy_all

kota_madiun = Lembaga.create(id: 1, nama_lembaga: 'Kota Madiun', kode_lembaga: '100', active: true)
kab_madiun = Lembaga.create(id: 2, nama_lembaga: 'Kabupaten Madiun', kode_lembaga: '101', active: true)

periode_kota = Periode.create(id: 1, tahun_awal: 2025, tahun_akhir: 2030, nama_periode: 'Periode 2025-2030',
                              lembaga_id: kota_madiun.id)
periode_kab = Periode.create(id: 2, tahun_awal: 2025, tahun_akhir: 2030, nama_periode: 'Periode 2025-2030',
                             lembaga_id: kab_madiun.id)

# Tahun dimiliki oleh periode per lembaga, memungkinkan pemisahan tahun per Kota / Kab
tahun_kota = (2025..2030).each { |th| Tahun.create(tahun: th, kelompok_anggaran: 'murni', periode_id: periode_kota.id) }
tahun_kab = (2025..2030).each { |th| Tahun.create(tahun: th, kelompok_anggaran: 'murni', periode_id: periode_kab.id) }

opd_super_admin_kota = Opd.create(id: 1, nama_opd: 'Super Admin Kota Madiun', kode_opd: '000',
                                  lembaga_id: kota_madiun.id)
opd_super_admin_kab = Opd.create(id: 2, nama_opd: 'Super Admin Kab Madiun', kode_opd: '001', lembaga_id: kab_madiun.id)

user_super_admin_kota = User.create(id: 1, email: 'admin@kota_madiun.com', nip: 'admin_kota_madiun1',
                                    password: '12345678')
user_super_admin_kab = User.create(id: 2, email: 'admin@kab_madiun.com', nip: 'admin_kab_madiun11',
                                   password: '12345678')

profile_super_admin_kota = Profile.create(id: 1, nama: 'Super Admin Kota Madiun', user_id: user_super_admin_kota.id,
                                          aktif: true)
profile_super_admin_kab = Profile.create(id: 2, nama: 'Super Admin Kabupaten Madiun', user_id: user_super_admin_kab.id,
                                         aktif: true)
