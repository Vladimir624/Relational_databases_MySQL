--
INSERT `user` (email, phone, password_hash, agree_process_pers_data) VALUES
	('14@yandex.ru', 89161237755, SHA1(email), 1),
    ('van95@yandex.ru', 89151200115, SHA1(email), 1),
    ('tito777@yandex.ru', 89066667155, SHA1(email), 1);
    
--
INSERT `profile` (user_id, firstname, lastname, gender, birthdate, receive_promo_email, receive_promo_sms) VALUES
	(18, 'Кирилл', 'Камазов', 'm', '2001-05-13', 0, 0),
    (19, 'Ирина', 'Светлакова', 'w', '2000-05-13', 1, 0),
    (20, 'Степан', 'Кутузов', 'm', '1998-04-21', 0, 0);
  
--
INSERT IGNORE `profile` (user_id, firstname, lastname, gender, birthdate, receive_promo_email, receive_promo_sms) VALUES
	(12, 'Кирилл', 'Камазов', 'm', '2001-05-13', 0, 0),
    (13, 'Иван', 'Филюшкин', 'm', '1990-06-29', 0, 0);  
    
--
INSERT `profile` SET
	user_id = 12, 
    firstname = 'Анжела', 
    lastname = 'Березкина', 
    gender = 'w', 
    birthdate = '1985-10-10', 
    receive_promo_email = 1,
    receive_promo_sms = 1;

--
UPDATE `user` SET
	password_hash = SHA1(email)
WHERE id = 12;

--
DELETE FROM `user` WHERE id = 14;
