-- Day 24(Practice question)

-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

SELECT hacker_id, name
FROM (
    SELECT h.hacker_id, h.name, COUNT(s.submission_id) AS submission_count
    FROM Hackers h
    INNER JOIN Submissions s ON h.hacker_id = s.hacker_id
    INNER JOIN Challenges ch ON s.challenge_id = ch.challenge_id
    INNER JOIN Difficulty d ON ch.difficulty_level = d.difficulty_level AND  	 s.score = d.score
    GROUP BY h.hacker_id, h.name
	) AS HACKERS_COUNTSUBMISSION
WHERE submission_count > 1
ORDER BY submission_count DESC, hacker_id ASC;

-- in summary, the syntax retrieves data from multiple tables(hackers, submission, challenges and difficult table), grouped it by hacker_id and name then calculates the number of submissions made by each hacker and filters the results to include only hackers with more than one submission, and orders the final result by hackers subimmission count and hackers id.