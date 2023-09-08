create database bstore;
use bstore
go

CREATE TABLE NhanVien (
    MaNhanVien CHAR(6) NOT NULL PRIMARY KEY,
    TenNhanVien NVARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    ChucVu INT NOT NULL,
    MatKhau CHAR(32) NOT NULL
);
CREATE TABLE KhachHang (
    MaKhachHang CHAR(6) NOT NULL PRIMARY KEY,
    HoTenKH NVARCHAR(100) NOT NULL,
    SoDienThoai VARCHAR(50),
    DiaChi NVARCHAR(150),
    Email NVARCHAR(50),
    SoTienNo MONEY NOT NULL,
    TongTien MONEY NOT NULL,
    NgayMuaCuoi DATE
);
CREATE TABLE PhieuNhapSach (
    MaPhieuNhapSach CHAR(6) NOT NULL PRIMARY KEY,
    NgayNhap DATE NOT NULL,
    MaNhanVien CHAR(6),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);
CREATE TABLE Sach (
    MaSach CHAR(6) NOT NULL PRIMARY KEY,
    TenSach NVARCHAR(255) NOT NULL,
    TacGia NVARCHAR(100),
    TheLoai NVARCHAR(100),
    SoLuong INT NOT NULL,
    GiaTien MONEY NOT NULL
);
CREATE TABLE HoaDon (
    MaHoaDon CHAR(6) NOT NULL PRIMARY KEY,
    MaKhachHang CHAR(6),
    MaNhanVien CHAR(6),
    NgayHoaDon DATE,
    GiamGia MONEY,
    TienKhachDaTra MONEY,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien)
);
CREATE TABLE ChiTietHoaDon (
    MaChiTietHoaDon CHAR(10) NOT NULL PRIMARY KEY,
    MaHoaDon CHAR(6),
    MaSach CHAR(6),
    SoLuongBan INT,
    DonGiaBan MONEY,
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
CREATE TABLE BaoCaoCongNo (
    MaBaoCaoCongNo CHAR(6) NOT NULL PRIMARY KEY,
    Thang INT NOT NULL,
    Nam INT NOT NULL
);
CREATE TABLE ChiTietBaoCaoCongNo (
    MaChiTietBaoCaoCongNo CHAR(10) NOT NULL PRIMARY KEY,
    MaBaoCaoCongNo CHAR(6),
    MaKhachHang CHAR(6),
    NoDau MONEY,
    NoCuoi MONEY,
    PhatSinh MONEY,
    FOREIGN KEY (MaBaoCaoCongNo) REFERENCES BaoCaoCongNo(MaBaoCaoCongNo),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);
CREATE TABLE BaoCaoTon (
    MaBaoCaoTon CHAR(6) NOT NULL PRIMARY KEY,
    Thang INT NOT NULL,
    Nam INT NOT NULL
);
CREATE TABLE ChiTietBaoCaoTon (
    MaChiTietBaoCaoTon CHAR(10) NOT NULL PRIMARY KEY,
    MaBaoCaoTon CHAR(6),
    MaSach CHAR(6),
    TonDau INT,
    TonCuoi INT,
    PhatSinh INT,
    FOREIGN KEY (MaBaoCaoTon) REFERENCES BaoCaoTon(MaBaoCaoTon),
    FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);


-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoCongNo
ALTER TABLE ChiTietBaoCaoCongNo
ADD CONSTRAINT FK_ChiTietBaoCaoCongNo_BaoCaoCongNo
FOREIGN KEY(MaBaoCaoCongNo)
REFERENCES BaoCaoCongNo(MaBaoCaoCongNo);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoCongNo
ALTER TABLE ChiTietBaoCaoCongNo
CHECK CONSTRAINT FK_ChiTietBaoCaoCongNo_BaoCaoCongNo;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoCongNo li�n quan ??n KhachHang
ALTER TABLE ChiTietBaoCaoCongNo
ADD CONSTRAINT FK_ChiTietBaoCaoCongNo_KhachHang
FOREIGN KEY(MaKhachHang)
REFERENCES KhachHang(MaKhachHang);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoCongNo li�n quan ??n KhachHang
ALTER TABLE ChiTietBaoCaoCongNo
CHECK CONSTRAINT FK_ChiTietBaoCaoCongNo_KhachHang;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoTon li�n quan ??n BaoCaoTon
ALTER TABLE ChiTietBaoCaoTon
ADD CONSTRAINT FK_ChiTietBaoCaoTon_BaoCaoTon
FOREIGN KEY(MaBaoCaoTon)
REFERENCES BaoCaoTon(MaBaoCaoTon);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoTon li�n quan ??n BaoCaoTon
ALTER TABLE ChiTietBaoCaoTon
CHECK CONSTRAINT FK_ChiTietBaoCaoTon_BaoCaoTon;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoTon li�n quan ??n Sach
ALTER TABLE ChiTietBaoCaoTon
ADD CONSTRAINT FK_ChiTietBaoCaoTon_Sach
FOREIGN KEY(MaSach)
REFERENCES Sach(MaSach);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietBaoCaoTon li�n quan ??n Sach
ALTER TABLE ChiTietBaoCaoTon
CHECK CONSTRAINT FK_ChiTietBaoCaoTon_Sach;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietHoaDon li�n quan ??n HoaDon
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_ChiTietHoaDon_HoaDon
FOREIGN KEY(MaHoaDon)
REFERENCES HoaDon(MaHoaDon);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietHoaDon li�n quan ??n HoaDon
ALTER TABLE ChiTietHoaDon
CHECK CONSTRAINT FK_ChiTietHoaDon_HoaDon;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietHoaDon li�n quan ??n Sach
ALTER TABLE ChiTietHoaDon
ADD CONSTRAINT FK_ChiTietHoaDon_Sach
FOREIGN KEY(MaSach)
REFERENCES Sach(MaSach);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietHoaDon li�n quan ??n Sach
ALTER TABLE ChiTietHoaDon
CHECK CONSTRAINT FK_ChiTietHoaDon_Sach;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietPhieuNhapSach li�n quan ??n PhieuNhapSach
ALTER TABLE ChiTietPhieuNhapSach
ADD CONSTRAINT FK_ChiTietPhieuNhapSach_PhieuNhapSach
FOREIGN KEY(MaPhieuNhapSach)
REFERENCES PhieuNhapSach(MaPhieuNhapSach);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietPhieuNhapSach li�n quan ??n PhieuNhapSach
ALTER TABLE ChiTietPhieuNhapSach
CHECK CONSTRAINT FK_ChiTietPhieuNhapSach_PhieuNhapSach;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng ChiTietPhieuNhapSach li�n quan ??n Sach
ALTER TABLE ChiTietPhieuNhapSach
ADD CONSTRAINT FK_ChiTietPhieuNhapSach_Sach
FOREIGN KEY(MaSach)
REFERENCES Sach(MaSach);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng ChiTietPhieuNhapSach li�n quan ??n Sach
ALTER TABLE ChiTietPhieuNhapSach
CHECK CONSTRAINT FK_ChiTietPhieuNhapSach_Sach;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng HoaDon li�n quan ??n KhachHang
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_KhachHang
FOREIGN KEY(MaKhachHang)
REFERENCES KhachHang(MaKhachHang);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng HoaDon li�n quan ??n KhachHang
ALTER TABLE HoaDon
CHECK CONSTRAINT FK_HoaDon_KhachHang;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng HoaDon li�n quan ??n NhanVien
ALTER TABLE HoaDon
ADD CONSTRAINT FK_HoaDon_NhanVien
FOREIGN KEY(MaNhanVien)
REFERENCES NhanVien(MaNhanVien);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng HoaDon li�n quan ??n NhanVien
ALTER TABLE HoaDon
CHECK CONSTRAINT FK_HoaDon_NhanVien;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng PhieuNhapSach li�n quan ??n NhanVien
ALTER TABLE PhieuNhapSach
ADD CONSTRAINT FK_PhieuNhapSach_NhanVien
FOREIGN KEY(MaNhanVien)
REFERENCES NhanVien(MaNhanVien);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng PhieuNhapSach li�n quan ??n NhanVien
ALTER TABLE PhieuNhapSach
CHECK CONSTRAINT FK_PhieuNhapSach_NhanVien;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng PhieuThu li�n quan ??n KhachHang
ALTER TABLE PhieuThu
ADD CONSTRAINT FK_PhieuThu_KhachHang
FOREIGN KEY(MaKhachHang)
REFERENCES KhachHang(MaKhachHang);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng PhieuThu li�n quan ??n KhachHang
ALTER TABLE PhieuThu
CHECK CONSTRAINT FK_PhieuThu_KhachHang;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng PhieuThu li�n quan ??n NhanVien
ALTER TABLE PhieuThu
ADD CONSTRAINT FK_PhieuThu_NhanVien
FOREIGN KEY(MaNhanVien)
REFERENCES NhanVien(MaNhanVien);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng PhieuThu li�n quan ??n NhanVien
ALTER TABLE PhieuThu
CHECK CONSTRAINT FK_PhieuThu_NhanVien;

-- Th�m r�ng bu?c kh�a ngo?i cho b?ng Sach li�n quan ??n TheLoaiSach
ALTER TABLE Sach
ADD CONSTRAINT FK_Sach_Sach
FOREIGN KEY(MaTheLoai)
REFERENCES TheLoaiSach(MaTheLoai);

-- Ki?m tra r�ng bu?c kh�a ngo?i cho b?ng Sach li�n quan ??n TheLoaiSach
ALTER TABLE Sach
CHECK CONSTRAINT FK_Sach_Sach;

CREATE TABLE [dbo].[TheLoaiSach] (
    [MaTheLoai] NVARCHAR(255) PRIMARY KEY,
    [TenTheLoai] NVARCHAR(255)
);

INSERT INTO [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [ChucVu])
VALUES ('NV001', 'Nguyen Van A', 1),
       ('NV002', 'Tran Thi B', 2);
INSERT [dbo].[NhanVien] ([MaNhanVien], [TenNhanVien], [NgaySinh], [ChucVu], [MatKhau]) VALUES (N'000003', N'Phan Th? �nh', CAST(N'1993-12-19' AS Date), 2, N'789abc')
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTenKH], [SoDienThoai], [DiaChi], [Email], [SoTienNo], [TongTien], [NgayMuaCuoi]) VALUES (N'000015', N'th�i v?nh to�n', N'0398886655', N'Tr�i ??t', N'vinhtoan@gmail.com', 0.0000, 0.0000, CAST(N'2019-06-18' AS Date))
INSERT [dbo].[TheLoaiSach] ([MaTheLoai], [TenTheLoai]) VALUES (N'00001', N'SGK')
INSERT [dbo].[Sach] ([MaSach], [TenSach], [MaTheLoai], [TacGia], [SoLuongTon], [DonGia], [NamXuatBan], [NhaXuatBan], [SoTrang], [MoTa], [AnhBia]) VALUES (N'000013', N'Theo d�ng l?ch s?', N'00003', N'Nguy?n Th? An', 0, 0.0000, 2017, N'NXB T?ng h?p TP.HCM', 367, NULL, NULL)
INSERT [dbo].[ThamSo] ([MaThamSo], [TenThamSo], [GiaTri]) VALUES (N'00003', N'TonSauKhiBan', 20)