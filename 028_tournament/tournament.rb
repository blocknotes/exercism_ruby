class Tournament
  class << self
    def tally(input)
      scores = {}
      input.split("\n").map { _1.split(';') }.each do |team1, team2, result|
        update_matches(scores, team1, team2, result)
      end
      calculate_scores(scores)
      ordered_scores = scores.sort do |a, b|
        b[1][:p] == a[1][:p] ? (a[0] <=> b[0]) : (b[1][:p] <=> a[1][:p])
      end
      format_output(ordered_scores)
    end

    private

    def update_matches(scores, team1, team2, result)
      scores[team1] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }
      scores[team2] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }

      case result
      when 'win' then increase_stats(scores, team1, team2, :w, :l)
      when 'draw' then increase_stats(scores, team1, team2, :d, :d)
      when 'loss' then increase_stats(scores, team1, team2, :l, :w)
      end
    end

    def increase_stats(scores, team1, team2, key1, key2)
      scores[team1][key1] += 1
      scores[team2][key2] += 1
      scores[team1][:mp] += 1
      scores[team2][:mp] += 1
    end

    def calculate_scores(scores)
      scores.each { |_team, stats| stats[:p] = stats[:w] * 3 + stats[:d] }
    end

    def format_output(scores)
      lines = ["#{'Team'.ljust(30)} | MP |  W |  D |  L |  P"]
      scores.each do |team, stats|
        values = stats.values.map { _1.to_s.rjust(2) }.join(' | ')
        lines << "#{team.ljust(30)} | #{values}"
      end
      lines << ''
      lines.join("\n")
    end
  end
end
