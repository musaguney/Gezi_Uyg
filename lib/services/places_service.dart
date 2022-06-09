import 'package:gezi_uygulamasi/models/places.dart';
import 'package:gezi_uygulamasi/repositories/repostory.dart';

class PlaceService {
  Repository? _repository;
  PlaceService() {
    _repository = Repository();
  }

  List<Places> placeList = [
    // PARKLAR
    Places(
      id: 1,
      title: "GÖZTEPE 60. YIL PARKI",
      subTitle: "",
      category: "Parklar",
      info:
          "istanbul’daki en güzel parklar listemizin ilki Göztepe 60. Yıl Parkı 2013 yılında tematik bir park haline getirildikten sonra rengarenk balıkların yaşadığı özel tasarım akvaryumları, lale ve gül bahçeleri, tik ağacından oyun teknesi, doğal göleti, fıskiyeleri ve her yaş grubundaki çocuklar için ayrı ayrı tasarlanmış oyun alanı ve ekipmanlarıyla Anadolu yakasının en gözde parklarından biri haline geldi. Göztepe’de, Bağdat Caddesi ve Sahil yolu arasında konumlandırılmış 60.",
      image: "https://img.piri.net/resim/site/615x326/16a1cb1f682471b4f.jpg",
    ),
    Places(
        id: 2,
        title: "Gülhane Parkı",
        subTitle: "",
        category: "Parklar",
        info:
            "Osmanlı döneminde Topkapı Sarayının bahçesi olarak kullanılmış ve sarayın güllerinin yetiştirildiği bahçe olan Gülhane Parkı konumu ve tarihsel izleri ile İstanbul’un en çok bilinen ve en çok ziyaret edilen parkıdır. Tarihi yarımadada, Topkapı Sarayının hemen önünde bulunan park içerisinde tarihe tanıklık etmiş bir çok ağacın yanı sıra bazı tarihi yapılarda mevcuttur. Bir dönem hayvanat bahçesi bulunmasına rağmen günümüzde Gebze’ye taşınmıştır.",
        image: "https://www.gezilesiyer.com/wp-content/uploads/2019/05/gulhane-parki.jpg"),

    //Kütüphaneler
    Places(
      id: 3,
      title: "Beyazıt Devlet Kütüphanesi",
      subTitle: "",
      category: "Kütüphaneler",
      info:
          "1884’te Kütüphane-i Umumi-i Osmani ismiyle kurulan kütüphane, muhteşem bir tarihi yapıda yer alıyor.Beyazıt Devlet Kütüphanesi, Türkiye’de devletin kurduğu ilk kütüphane olmasıyla da büyük bir öneme sahip.",
      image: "https://blog.obilet.com/wp-content/uploads/2020/03/Beyaz%C4%B1t-Devlet-K%C3%BCt%C3%BCphanesi-%C4%B0stanbul.webp",
      openHours: "08:00 - 23:00",
      price: "Ücretsiz",
    ),
    Places(
      id: 4,
      title: "Merkezefendi Millet Kıraathanesi ",
      subTitle: "",
      category: "Kütüphaneler",
      info:
          "Cevizlibağ’a yakınlığıyla öne çıkan kütüphane hem metrobüsle hem de Bağcılar-Kabataş tramvay hattıyla olayca ulaşabileceğiniz bir konumda yer alıyor.Merkezefendi Millet Kıraathanesi; Merkezefendi Camii ve Mezarlığı, Yenikapı Mevlevihanesi, Panaroma 1453 Tarih Müzesi gibi tarihi ve turistik noktalara da kolayca gidilebilecek bir yerde bulunuyor.",
      image:
          "https://blog.obilet.com/wp-content/uploads/2020/03/Merkezefendi-Millet-K%C4%B1raathanesi-Merkezefendi-%C5%9Eehir-K%C3%BCt%C3%BCphanesi-%C4%B0stanbul.webp",
      openHours: "08:00 - 00:00",
      price: "Ücretsiz",
    ),

    //Tarihi Yerler,
    Places(
        id: 5,
        title: "Galata kulesi ",
        subTitle: "",
        category: "Tarihi Yerler",
        info:
            "Galata Kulesi ilk olarak Bizans İmparatoru Justinianos tarafından MS 507 - 508 yılında inşa edilmiştir. Günümüzdeki kuleyi 1348 - 49 yılında Cenevizliler yeniden inşa etmiştir. Kule 1445 - 46 yılları arasında yükseltilmiştir. 1500'lü yıllarda depremden zarar görerek Mimar Murad bin Hayreddin tarafından onarılmıştır. III. Selim döneminde kule onarıldıktan sonra, kulenin üst katına bir cumba eklenir. 1831'de kule bir yangın daha geçirir, II. Mahmut kulenin üzerine iki kat daha çıkar ve külah biçiminde olan ünlü dam örtüsüyle kulenin tepesi kapatılır. 1967'de onarım gören kule, 2020 yılında tekrar restore edilir.",
        image: "https://www.cumhuriyet.com.tr/Archive/2021/7/4/1849727/kapak_174441.jpg",
        openHours: "09:00 - 22:00",
        price: "35 TL"),
    Places(
        id: 6,
        title: "Kız kulesi",
        subTitle: "",
        category: "Tarihi Yerler",
        info:
            "Resmi kaynakları baz alan tarihçiler, Kız Kulesi’nden ilk defa MÖ 400’lü yıllarda bahsedildiğini belirtirler. Bilindiği kadarıyla deniz ticareti için bir gümrük noktası olarak kurulmuştur. Kuran ise Atinalı bir komutandır. Atina, o dönem önemli ve bölgede hakim bir Yunan şehir devleti idi. Yüzyıllar boyunca bu küçük kayalığın, kendisine yüklenen bu görevi yerine getirdiği bilinen bir gerçektir. Bununla ilintili bir de efsane vardır, aşağıda anlatacağım.",
        image: "https://cdnuploads.aa.com.tr/uploads/Contents/2021/09/04/thumbs_b_c_fab7c43a6321040f570495d797829430.jpg?v=135050",
        openHours: "09:00 - 23:00",
        price: "45 TL"),

    //İbadet Yerleri
    Places(
        id: 7,
        title: "Sultan Ahmet Camii",
        subTitle: "",
        category: "İbadet Yerleri",
        info:
            "Sultan Ahmed Camii, kareye yakın iki plândan oluşmakta; bunun birini avlu di­ğerini de harim meydana getirmektedir. Cami, yüksek bir subasman üzerindedir. Mimar Mehmet Ağa'nın camiin zeminini yer seviyesinden yükselttiğine bakılırsa, onu belli bir seviyeden itibaren çevreye göstermek istediğine kuşku yoktur. Ayasof­ ya'mn karşısında yapacağı binanın, daha yüksek görünmesini istediği anlaşılabilir. Bunun için, camiin yalnız iç avlu ve harimi için bir set yapılmıştır. Ayrıca Ayasofya'mn civarında duran bir insan­ ın, camii nasıl göreceği çok iyi hesap­ lanmıştır.",
        image: "https://www.bizevdeyokuz.com/wp-content/uploads/sultanahmet-cami-istanbul-kapak-1280x720.jpg"),
    Places(
        id: 8,
        title: "Ayasofya Camii",
        subTitle: "",
        category: "İbadet Yerleri",
        info:
            "Ayasofya, İstanbul’un Tarihi Yarımadası Sultanahmet’te konumlanmış olan özel ve önemli bir esedir. Kendisi ile aynı ismi taşıyan meydanda bulunmaktadır. Dünya tarihinde ve mimarisinde sembol olarak kabul edilen eserler arasında yer alır.Ayasofya, “Kutsal Bilgelik” anlamına gelir. Anlamından dolayı İmparator Jüstinyen, kiliseye bu ismi vermiştir.",
        image: "https://cdnuploads.aa.com.tr/uploads/Contents/2020/07/17/thumbs_b_c_dc7fb7c4908e66a1b28c28d14d514885.jpg"),

    //Oteller
    Places(
        id: 9,
        title: "Hilton Otel",
        subTitle: "",
        category: "Oteller",
        info:
            "Sed sed est condimentum, cursus eros ut, fermentum velit. Sed finibus augue velit, et porttitor dolor volutpat id. Quisque elit diam, commodo at augue sed, condimentum tempor lacus. Proin aliquet nisi sed nisl mollis lacinia. Etiam non nibh sem. Integer hendrerit nisi justo, vitae consequat mi pellentesque non. Donec laoreet, dui eget feugiat congue, lacus est vestibulum dui, id aliquet quam leo id est. Morbi a pulvinar sapien. ",
        image: "https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_1300,q_auto,w_2000/itemimages/25/88/25887_v10.jpeg",
        price: "300 \$"),
    Places(
        id: 10,
        title: "Hotel Swissôtel The Bosphorus",
        subTitle: "",
        category: "Oteller",
        info:
            "Çarşıyı keşfettiğiniz, Haliç'te tekne gezisi yaptığınız veya zarif bir akşam yemeği yediğiniz bir günün ardından, Swissotel İstanbul konumu Türkiye'nin en dinamik şehrindeki eviniz olacaktır. İster eğlence ister üretmek için seyahate çıkın, dairelerimiz günümüzün donanımlı seyahat severlerinin ihtiyaçlarını karşılayacaktır. Ayrı bir mutfağa, özel yaşama ve yemek odalarına ve ilhamını konfordan alan bir yatak odasına sahip olan daireniz çalışacak, dinlenecek ve oynayacak bir alan sunar. Bu modern ancak tarihi şehirde size ait bir yer hissini yaratmak amacıyla, en iyi Türk malzemelerini ve en yeni elektronik cihazları bir araya getirdik. Panoramik Boğaz manzarasından en ince detaylara kadar, dairenizi en iyi olduğunuz şeyi yapabilmeniz için kişiselleştirdik.",
        image: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/f3/3b/55/exterior-view.jpg?w=900&h=600&s=1",
        price: "250 \$"),

    //Marketler
    Places(
        id: 11,
        title: "Forum İstanbul AVM",
        subTitle: "",
        category: "Market / AVM",
        info:
            "Türkiye’nin en büyük alışveriş ve eğlence merkezi Forum İstanbul, ziyaretçilerine 286 yerli ve yabancı mağazadan oluşan bambaşka bir dünya sunuyor. Ayrıca, Forum İstanbul LEGOLAND® Discovery Center, SEA LIFE Istanbul Akvaryum, FunLab, Cinemaximum Sinemaları ve Joypark gibi eşsiz eğlence merkezlerine de ev sahipliği yapıyor.",
        image: "https://www.forumistanbul.com.tr/media/image/slider1tabl.jpg",
        openHours: "10:00 - 22:00"),
    Places(
        id: 12,
        title: "Hilton AVM",
        subTitle: "",
        category: "Market / AVM",
        info:
            "Hilltown Avm, 3 gün 3 gece süren görkemli şov ve konserlerle ilk ziyaretçilerini karşıladı. İhtişamlı ışık şovları ile geceyi Taikos'un ritimleri eşliğinde aydınlatıp, elektro sesler ve deniz canlıları ile eşi benzeri görülmemiş bir deneyim yaşattı. 4 kıtada 20'den fazla ülkede yaptıkları sıra dışı şovlarla adından söz ettiren Vertical Show da Hilltown açılışını için ilk kez Türkiye'ye geldi",
        image:
            "https://iasbh.tmgrup.com.tr/11dfb4/800/420/0/16/622/343?u=https://isbh.tmgrup.com.tr/sbh/2020/03/01/maltepe-hilltown-avm-calisma-saatleri-2020-hilltown-avm-saat-kacta-aciliyor-kacta-kapaniyor-1583071302646.jpg",
        openHours: "10:00 - 22:00"),

    //Otoparklar
    Places(
        id: 13,
        title: "Beşiktaş İspark",
        subTitle: "",
        category: "Otoparklar",
        info: "Beşiktaşın göbeğinde bulunan ve İBB tarafından işletilen ispark hem uygun fiyat hemde güvenli bir otoparktır",
        image: "https://ispark.istanbul/wp-content/uploads/2014/07/642.jpg",
        openHours: "06:00 - 00:00",
        price: "15 TL"),
    Places(
        id: 14,
        title: "Taksim Gezi Parkı Otoparkı",
        subTitle: "",
        category: "Otoparklar",
        info:
            "Taksimi ziyarete gittiğinizde araç park yeri bulmak gerçekten sıkıntı olabilir.Taksim Gezi Parkı Otoparkı taksimde bu sorunu rahatlıkla çözebileceğiniz bir otoparktır. ",
        image: "https://politeknik.org.tr/wp-content/uploads/2014/11/gezi_park_sit.jpg",
        openHours: "07:00 - 00:00",
        price: "20 TL"),
  ];

  Future<double> getPlaceAveragePoint(int placeId) async {
    List response = await _repository?.readDataByProperty('comments', "placeId", placeId);

    int totalPoint = 0;
    if (response.isNotEmpty) {
      for (var element in response) {
        totalPoint = element["point"] + totalPoint;
      }

      return totalPoint / response.length;
    }
    return 0;
  }
}
