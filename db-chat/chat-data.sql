SELECT
    users.username,
    messages.content,
    messages.created_at
FROM messages
JOIN users
    ON messages.sender_id = users.id
WHERE messages.conversation_id = 1
ORDER BY messages.id;

-- Show all users
SELECT * FROM users;

-- Show all messages
SELECT * FROM messages;

-- Add another message from Bob
INSERT INTO messages (conversation_id, sender_id, content)
VALUES (1, 2, 'See you tomorrow!');


