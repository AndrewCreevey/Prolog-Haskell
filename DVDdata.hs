module DVDdata
where 

penaltyPerDay :: Float
penaltyPerDay = 5.0

type DVD = (String, String, String, Integer) 

listDVD :: [DVD]
listDVD = [
    ("19987653", "Reno 911       ", "YES", 0),
    ("09987652", "Something New  ", "YES", 0),
    ("29987654", "Celtic Woman   ", "NO ", 3),
    ("39987655", "Bewitched      ", "YES", 0),
    ("49987656", "Hannibal Rising", "NO ", 2),
    ("59987657", "Heros          ", "YES", 0),
    ("69987655", "Hamlet         ", "YES", 0),
    ("79987655", "A Bug's Life   ", "YES", 0),
    ("79987656", "A Bug's Life   ", "YES", 0),
    ("89987655", "Hanni Und Nanni", "YES", 0)]