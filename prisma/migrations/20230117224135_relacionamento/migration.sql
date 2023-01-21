-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_daysHabits" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "day_id" TEXT NOT NULL,
    "habit_id" TEXT NOT NULL,
    CONSTRAINT "daysHabits_day_id_fkey" FOREIGN KEY ("day_id") REFERENCES "days" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "daysHabits_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_daysHabits" ("day_id", "habit_id", "id") SELECT "day_id", "habit_id", "id" FROM "daysHabits";
DROP TABLE "daysHabits";
ALTER TABLE "new_daysHabits" RENAME TO "daysHabits";
CREATE UNIQUE INDEX "daysHabits_day_id_habit_id_key" ON "daysHabits"("day_id", "habit_id");
CREATE TABLE "new_habit_wek_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "habit_id" TEXT NOT NULL,
    "week_day" INTEGER NOT NULL,
    CONSTRAINT "habit_wek_days_habit_id_fkey" FOREIGN KEY ("habit_id") REFERENCES "habits" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_habit_wek_days" ("habit_id", "id", "week_day") SELECT "habit_id", "id", "week_day" FROM "habit_wek_days";
DROP TABLE "habit_wek_days";
ALTER TABLE "new_habit_wek_days" RENAME TO "habit_wek_days";
CREATE UNIQUE INDEX "habit_wek_days_habit_id_week_day_key" ON "habit_wek_days"("habit_id", "week_day");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
