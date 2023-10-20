
CREATE TABLE playrecord(
	userid  VARCHAR(8),
	songid  VARCHAR(8),
	play_at DATE 
);

-- DROP TABLE playrecord;

INSERT INTO playrecord VALUES('001', '013', '2023-10-09');
INSERT INTO playrecord VALUES('001', '014', '2023-10-10');
INSERT INTO playrecord VALUES('002', '003', '2023-10-10');
INSERT INTO playrecord VALUES('002', '004', '2023-10-09');
INSERT INTO playrecord VALUES('002', '005', '2023-10-11');


SELECT userid, songid, play_at,
	ROW_NUMBER() OVER (PARTITION BY userid ORDER BY play_at) AS row_rank
	FROM playrecord;



SELECT userid, songid, play_at,row_rank
FROM(
SELECT userid, songid, play_at,
	ROW_NUMBER() OVER (PARTITION BY userid ORDER BY play_at) AS row_rank
	FROM playrecord
) AS PR
WHERE row_rank = 1;