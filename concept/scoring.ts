
export class Team {
    public dead = 0;
    public hasRetreated = false;
    constructor(public readonly playercount: number) {}
}

export class CapturePoint {
    constructor(public owner: Team|undefined) {}
}

export class Setup {
    constructor(
        public readonly attackers: Team,
        public readonly defenders: Team,
        public readonly caps: CapturePoint[],
    ) {
    }

    public static fromCounts(attackerCount, defenderCount, capCount): Setup {
        const attackers = new Team(attackerCount);
        const defenders = new Team(defenderCount);
        const caps = [];
        for (let i = 0; i < capCount; i++) {
            caps.push(new CapturePoint(defenders));
        }

        return new Setup(attackers, defenders, caps);
    }

    public getTeamCapScore(team: Team): number {
        const ourCapScore = this.caps
            .filter(_ => _.owner === team)
            .length;
        const theirCapScore = this.caps
            .filter(_ => _.owner && _.owner !== team)
            .length;
        return (ourCapScore - theirCapScore) / this.caps.length;
    }

    public getScore(team: Team, isAlive: boolean): number {
        return this.getTeamCapScore(team)
            + this.getPlayerIsAliveScore(isAlive)
            + this.getTeamCasualtiesScore(team);
    }

    public getTeamCasualtiesScore(team: Team): number {
        const aMalus = this.attackers.dead / this.attackers.playercount;
        const dMalus = this.defenders.dead / this.defenders.playercount;
        switch (team) {
            case this.attackers: return (dMalus - aMalus) / 2;
            case this.defenders: return (aMalus - dMalus) / 2;
            default: throw new Error('unknown team');
        }
    }

    public getPlayerIsAliveScore(isAlive: boolean): number {
        let totalDead = this.attackers.dead + this.defenders.dead;
        let totalPlayerCount = this.attackers.playercount + this.defenders.playercount;

        let score;
        if (isAlive) {
            score = totalDead / totalPlayerCount
        } else {
            score = - (totalPlayerCount - totalDead) / totalPlayerCount;
        }

        return score;
    }
}
