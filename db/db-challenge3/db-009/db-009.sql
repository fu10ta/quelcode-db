SELECT count(p.id) AS '投稿数',r.name AS チャットルーム名
FROM posts p
JOIN users u ON p.created_user_id = u.id
JOIN rooms r ON p.room_id = r.id
WHERE u.is_deleted = 0
AND p.is_deleted = 0
GROUP BY r.id
ORDER BY 投稿数 DESC;
