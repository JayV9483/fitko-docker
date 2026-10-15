queries


INSERT INTO users (username, email, created_at, password_hash)
VALUES 
('alice', 'alice@gmail.com', '2025-01-01T00:00:00.000Z', '1234'), 
('bob', 'bob@gmail.com', '2025-02-01T00:01:01.000Z', '7894');

INSERT INTO users (username, email, created_at, password_hash)
VALUES 
('juraj', 'juraj@gmail.com', '2025-03-01T00:01:01.000Z', '7894');


INSERT INTO conversations (title)
VALUES ('Alice and Bob');

INSERT INTO conversations (title)
VALUES ('Alice and Juraj');

INSERT INTO conversations (title)
VALUES ('Alice and Juraj and Bob');


INSERT INTO conversation_members (conversation_id, user_id)
VALUES 
(1, 2), 
(1, 3);

INSERT INTO conversation_members (conversation_id, user_id)
VALUES 
(2, 2), 
(2, 5);

INSERT INTO conversation_members (conversation_id, user_id)
VALUES 
(3, 2), 
(3, 5),
(3, 3);

insert into messages (conversation_id, sender_id, content, created_at) values 
(3, 3, 'hello alice', '2025-02-01T00:01:01.000Z')

insert into messages (conversation_id, sender_id, content, created_at) values 
(3, 2, 'hello bob', '2025-02-01T00:01:13.000Z')

select c.title, u.username, m."content", m.created_at from messages m join users u on m.sender_id = u.id join conversations c on m.conversation_id = c.id where m.conversation_id  = 3 order by m.created_at desc;

select * from conversation_members where conversation_id=1;

select * from conversation_members where user_id=5;

