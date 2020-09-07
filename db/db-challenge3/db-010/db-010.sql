SELECT u.name AS ユーザー名, pp.投稿日時 AS 投稿日時, r.name AS チャットルーム名
FROM posts p
JOIN(
    SELECT MAX(created_at) AS 投稿日時
    FROM posts
    WHERE is_deleted = 0
    GROUP BY room_id
)AS pp
ON p.created_at = pp.投稿日時
JOIN users u
ON p.created_user_id = u.id
JOIN rooms r
ON p.room_id = r.id
WHERE u.is_deleted =0
ORDER BY r.id;
