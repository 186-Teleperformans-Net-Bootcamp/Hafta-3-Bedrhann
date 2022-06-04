# Hafta-3-Bedrhann

-Messages ve Posts tablosunda yapılan değişiklikler bu 2 tablonun kendi altında bulunan 2 trigger ile HistoryMessages ve HistoryPosts tablolarına değişiklik yapılan satırın değişiklikten önceki hali ve değişikliğin yapıldığı tarih olarak ekleniyor.

-Friends tablosunda yeni bir arkadaşlık isteği geldiğinde alıcı, gönderici ve Confirmation sütünü  eklenioyor, Confirmation default false olarak ekleniyor. Friends tablosuna bu şekilde bir veri girişi olduğunda FriendshipConfirmation tablosuna trigger aracılığı ile bir istek ekleniyor, buraya eklenen isteğin Confirmation sütünü eğer true olarak değiştirilirse yani istek kabul edilirse Friends tablosundaki arkadaşlık da trigger aracılığı ile true olarak aktifleşiyor.

-MostMessage prosedürü kullanıcıları en çok mesaj atandan en az mesaj atan şeklinde sıralı bir tablosunu dönüyor.





