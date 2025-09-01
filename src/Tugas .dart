import 'dart:io';

void main(List<String> args) {
  String? name;
  int? jamKerjaPerMinggu;
  double? upahPerJam;
  bool? statusKaryawan;
  double gajiBersih;

  stdout.write("Masukkan Nama : ");
  name = stdin.readLineSync();

  do {
    stdout.write("Jam kerja per minggu : ");
    jamKerjaPerMinggu = int.parse(stdin.readLineSync()!);
    if (jamKerjaPerMinggu <= 0) {
      print("Jam kerja harus lebih dari 0, coba lagi!");
    }
  } while (jamKerjaPerMinggu <= 0);

  do {
    stdout.write("Upah per jam : ");
    upahPerJam = double.parse(stdin.readLineSync()!);
    if (upahPerJam <= 0) {
      print("Upah per jam harus lebih dari 0, coba lagi!");
    }
  } while (upahPerJam <= 0);

  do {
    stdout.write("Status karyawan (tetap/kontrak) : ");
    String? inputStatus = stdin.readLineSync();
    if (inputStatus != null) {
      String status = inputStatus.trim().toLowerCase();
      if (status == "tetap") {
        statusKaryawan = true;
        break;
      } else if (status == "kontrak") {
        statusKaryawan = false;
        break;
      } else {
        print("Input tidak valid! Harus 'tetap' atau 'kontrak'. Coba lagi.");
      }
    }
  } while (true);

  double gajiKotor = jamKerjaPerMinggu * upahPerJam;
  double pajak = statusKaryawan! ? gajiKotor * 0.10 : gajiKotor * 0.05;
  gajiBersih = gajiKotor - pajak;

  print("\n--- SLIP GAJI ---");
  print("Nama: $name");
  print("Jam kerja per minggu: $jamKerjaPerMinggu");
  print("Upah per jam: Rp$upahPerJam");
  print("Status karyawan : ${statusKaryawan ? "Tetap" : "Kontrak"}");
  print("Gaji Kotor: Rp$gajiKotor");
  print("Pajak: Rp$pajak");
  print("Gaji Bersih (setelah pajak): Rp$gajiBersih");
}