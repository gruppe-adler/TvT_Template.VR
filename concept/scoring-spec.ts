import {Setup} from './scoring';

describe('Scoring', () => {
    let x;

    describe('scores from cap', () => {

        beforeEach(() => {
            x = Setup.fromCounts(20, 10, 3);
        });

        it('is a zero-sum game', () => {
            expect(x.getTeamCapScore(x.attackers)).toEqual(- x.getTeamCapScore(x.defenders));
            x.caps[0].owner = x.attackers;
            expect(x.getTeamCapScore(x.attackers)).toEqual(- x.getTeamCapScore(x.defenders));
            x.caps[1].owner = x.attackers;
            expect(x.getTeamCapScore(x.attackers)).toEqual(- x.getTeamCapScore(x.defenders));
            x.caps[2].owner = undefined;
            expect(x.getTeamCapScore(x.attackers)).toEqual(- x.getTeamCapScore(x.defenders));
        });
        it('returns positive for a team with more caps than the other', () => {
            x.caps[0].owner = x.attackers;
            x.caps[1].owner = x.attackers;
            expect(x.getTeamCapScore(x.attackers)).toBeGreaterThan(0);
        });
        it('returns negative for a team with less caps than the other', () => {
            x.caps[1].owner = x.attackers;
            expect(x.getTeamCapScore(x.attackers)).toBeLessThan(0);
        });
        it('is zero if no-one captured anything', () => {
            x.caps.forEach(_ => _.owner = undefined);
            expect(x.getTeamCapScore(x.attackers)).toEqual(0);
        });
        it('returns a max value of 1', () => {
           expect(x.getTeamCapScore(x.defenders)).toEqual(1);
        });

        it('returns a min value of -1', () => {
            expect(x.getTeamCapScore(x.attackers)).toEqual(-1);
        });
    });

    describe('scores from death', () => {

        beforeEach(() => {
            x = Setup.fromCounts(5, 5, 0);
        });

        describe('getTeamCasualtiesScore', () => {
            it('it as zero-sum game', () => {
                expect(x.getTeamCasualtiesScore(x.attackers)).toBeCloseTo(- x.getTeamCasualtiesScore(x.defenders), 0.001);
                x.attackers.dead = 2;
                expect(x.getTeamCasualtiesScore(x.attackers)).toBeCloseTo(- x.getTeamCasualtiesScore(x.defenders), 0.001);
                x.defenders.dead = 4;
                expect(x.getTeamCasualtiesScore(x.attackers)).toBeCloseTo(- x.getTeamCasualtiesScore(x.defenders), 0.001);
            });
            it('returns a min/max score of -1/1', () => {
                x.attackers.dead = 5;
                expect(x.getTeamCasualtiesScore(x.attackers)).toEqual(-0.5);
                expect(x.getTeamCasualtiesScore(x.defenders)).toEqual(0.5);
            });
        });

        describe('getPlayerIsAliveScore', () => {
            it('is a zero-sum game', () => {
                x.attackers.dead = 4;
                const scoreSum = x.getPlayerIsAliveScore(true)
                    + x.getPlayerIsAliveScore(false) * 4
                    + x.getPlayerIsAliveScore(true) * 5;

                expect(scoreSum).toEqual(0);
            });
            it('gives same bonus to all surviving players', () => {
                x.attackers.dead = 4;

                expect(x.getPlayerIsAliveScore(true)).toEqual(0.4);
            });

            it('gives same malus to all surviving players', () => {
                x.attackers.dead = 4;

                expect(x.getPlayerIsAliveScore(false)).toEqual(-0.6);
            });
        });
    });

    describe('getScore', () => {

        it('gives the sum of all the individual scores', () => {
            x = Setup.fromCounts(6, 4, 3);
            x.attackers.dead = 3;
            x.defenders.dead = 2;
            x.caps[0].owner = this.attackers;

            expect(x.getScore(x.attackers, true)).toBeCloseTo(
                x.getTeamCasualtiesScore(x.attackers)
                + x.getTeamCapScore(x.attackers)
                + x.getPlayerIsAliveScore(true)
            , 0.001);

            expect(x.getScore(x.defenders, true)).toBeCloseTo(
                x.getTeamCasualtiesScore(x.defenders)
                + x.getTeamCapScore(x.defenders)
                + x.getPlayerIsAliveScore(true)
                , 0.001);
        });

        it('returns max of 2 for perfect victory in a 1on1', () => {
            x = Setup.fromCounts(1, 1, 1);
            x.attackers.dead = x.attackers.playercount;

            expect(x.getScore(x.defenders, true)).toBe(2);
            expect(x.getScore(x.attackers, false)).toBe(-2);
        });


        it('returns max of 2 for perfect victory in a 10on10', () => {
            x = Setup.fromCounts(10, 10, 3);
            x.attackers.dead = x.attackers.playercount;

            expect(x.getScore(x.defenders, true)).toBe(2);
            expect(x.getScore(x.attackers, false)).toBe(-2);
        });
    });
});
