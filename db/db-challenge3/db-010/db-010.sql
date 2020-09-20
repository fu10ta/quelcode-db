SELECT u.name AS ユーザー名, pp.投稿日時 AS 投稿日時, r.name AS チャットルーム名
FROM (
    SELECT MAX(created_at) AS 投稿日時,room_id
    FROM posts
    WHERE is_deleted = 0
    GROUP BY room_id
)AS pp
JOIN posts p
ON pp.room_id = p.room_id
AND 投稿日時 = p.created_at
JOIN users u
ON p.created_user_id = u.id
JOIN rooms r
ON p.room_id = r.id
WHERE u.is_deleted =0
ORDER BY r.id;
