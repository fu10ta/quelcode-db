SELECT u.name AS ユーザー名, r.name AS チャットルーム名, SUBSTRING(ur.joined_at, 1, 10) AS 参加日時
FROM users_rooms ur
JOIN users u ON ur.user_id = u.id
JOIN rooms r ON ur.room_id = r.id
WHERE u.is_deleted = 0
AND r.is_deleted = 0
ORDER BY ur.joined_at;
