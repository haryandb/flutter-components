class Helpers {
  static String sapan([DateTime? waktu]) {
    waktu ??=
        DateTime.now(); // Jika waktu tidak diberikan, gunakan waktu sekarang
    int jam = waktu.hour;

    if (jam >= 5 && jam < 12) {
      return "Selamat Pagi!";
    } else if (jam >= 12 && jam < 15) {
      return "Selamat Siang!";
    } else if (jam >= 15 && jam < 18) {
      return "Selamat Sore!";
    } else {
      return "Selamat Malam!";
    }
  }

  static String wrapText(String? deskripsi) {
    if (deskripsi == null) {
      return "";
    }
    if (deskripsi.length <= 100) {
      return deskripsi;
    }
    return deskripsi.substring(0, 100);
  }
}
