/*create database HayvanSahiplendirmeDB
go*/

create table Kullanicilar(
	KullaniciID int primary key identity(1,1),
	AdSoyad nvarchar(100) not null,
	Eposta nvarchar(150) not null unique,
	Sifre nvarchar(255) not null,
	Telefon nvarchar(20),
	KayitTarihi datetime2 default SYSDATETIME(),
	rol nvarchar(20)
);

create table HayvanTurleri(
	TurID int primary key identity(1,1),
	TurAdi nvarchar(50) not null unique
);

create table Hayvanlar(
	HayvanID int primary key identity(1,1),
	TurID int not null,
	HayvanAdi nvarchar(50) not null,
	HayvanCins nvarchar(100),
	Cinsiyet nvarchar(10),
	DogumTarihi date,
	Aciklama nvarchar(1000),

	foreign key(TurID)
	references HayvanTurleri(TurID)
);

create table Sehirler(
	SehirID int primary key identity(1,1),
	SehirAdi nvarchar(50) not null unique
);

create table Ilanlar(
	IlanID int primary key identity(1,1),
	KullaniciID int not null,
	HayvanID int not null,
	SehirID int not null,
	IlanBasligi nvarchar(150) not null,
	IlanAciklamasi nvarchar(1000),
	IlanTarihi datetime2 default SYSDATETIME(),
	Durum nvarchar(20),

	foreign key(KullaniciID)
	references Kullanicilar(KullaniciID),

	foreign key(HayvanID)
	references Hayvanlar(HayvanID),

	foreign key(SehirID)
	references Sehirler(SehirID)
);

create table HayvanFotograflari(
	FotografID int primary key identity(1,1),
	IlanID int not null,
	FotografYolu nvarchar(500),
	YuklemeTarihi datetime2 default SYSDATETIME(),

	foreign key(IlanID)
	references Ilanlar(IlanID)
);

create table Basvuru(
	BasvuruID int primary key identity(1,1),
	KullaniciID int not null,
	IlanID int not null,
	BasvuruTarihi datetime2 default SYSDATETIME(),
	BasvuruMesaji nvarchar(500),
	Durum nvarchar(20),

	foreign key(KullaniciID)
	references Kullanicilar(KullaniciID),

	foreign key(IlanID)
	references Ilanlar(IlanID)
);

create table Favoriler(
	KullaniciID int not null,
	IlanID int not null,
	EklemeTarihi datetime2 default SYSDATETIME(),

	primary key (KullaniciID, IlanID),

	foreign key(KullaniciID)
	references Kullanicilar(KullaniciID),

	foreign key(IlanID)
	references Ilanlar(IlanID)
);

use HayvanSahiplendirmeDB;
go

select name from sys.tables;



