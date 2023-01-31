class TwoBucket
  BUCKET_ONE = 0
  BUCKET_TWO = 1
  SKIP_ACTION = 2

  attr_reader :goal_bucket, :moves, :other_bucket

  def initialize(capacity1, capacity2, target, starting_bucket)
    @target = target
    @starting_bucket_id = starting_bucket == "one" ? BUCKET_ONE : BUCKET_TWO
    @capacities = [capacity1, capacity2]
    @other_bucket = nil
    solve
  end

  private

  attr_reader :buckets_list, :capacities, :starting_bucket_id, :target

  def solve
    @buckets_list = [action_fill_bucket([0, 0], starting_bucket_id)]
    @moves = 1
    loop do
      break if check_buckets_list
      move
    end
  end

  def move
    @buckets_list = buckets_list.flat_map do |buckets|
      actions = available_actions.select { send("can_#{_1}?", buckets, _2) }
      new_buckets = actions.filter_map do |action, bucket_id|
        if buckets[SKIP_ACTION] == [action, bucket_id]
          buckets[SKIP_ACTION] = nil
          next
        end

        send("action_#{action}", buckets.dup, bucket_id)
      end
    end
    @moves += 1
  end

  def check_buckets_list
    result = buckets_list.find { _1.include? target }
    return false if result.nil?

    @goal_bucket = result[0] == target ? "one" : "two"
    @other_bucket = result[0] == target ? result[1] : result[0]
    true
  end

  def other_bucket_id(bucket)
    case bucket
    when BUCKET_ONE then BUCKET_TWO
    when BUCKET_TWO then BUCKET_ONE
    else starting_bucket_id
    end
  end

  def bucket_empty?(buckets, bucket_id) = buckets[bucket_id].zero?

  def bucket_full?(buckets, bucket_id) = buckets[bucket_id] == capacities[bucket_id]

  def can_empty_bucket?(buckets, bucket_id)
    buckets[bucket_id] > 0 &&
      (bucket_id != starting_bucket_id || !bucket_full?(buckets, other_bucket_id(bucket_id)))
  end

  def can_fill_bucket?(buckets, bucket_id)
    !bucket_full?(buckets, bucket_id) &&
      (bucket_id == starting_bucket_id || !bucket_empty?(buckets, starting_bucket_id))
  end

  def can_transfer_from_bucket?(buckets, from_bucket_id)
    to = other_bucket_id(from_bucket_id)
    if from_bucket_id == starting_bucket_id
      quantity = transfer_quantity(buckets, to)
      next_from_level = buckets[from_bucket_id] - quantity
      next_to_level = buckets[to] + quantity
      return false if next_from_level.zero? && next_to_level == capacities[to]
    end
    !bucket_full?(buckets, to) && buckets[from_bucket_id] > 0
  end

  def transfer_quantity(buckets, from_bucket_id)
    to = other_bucket_id(from_bucket_id)
    available_space = (capacities[to] - buckets[to])
    buckets[from_bucket_id] <= available_space ? buckets[from_bucket_id] : available_space
  end

  def action_empty_bucket(buckets, bucket_id)
    buckets[SKIP_ACTION] = [:fill_bucket, bucket_id] if bucket_full?(buckets, bucket_id)
    buckets[bucket_id] = 0
    buckets
  end

  def action_fill_bucket(buckets, bucket_id)
    buckets[SKIP_ACTION] = [:empty_bucket, bucket_id] if buckets[bucket_id].zero?
    buckets[bucket_id] = capacities[bucket_id]
    buckets
  end

  def action_transfer_from_bucket(buckets, bucket_id)
    quantity = transfer_quantity(buckets, bucket_id)
    buckets[bucket_id] -= quantity
    buckets[other_bucket_id(bucket_id)] += quantity
    buckets
  end

  def available_actions
    [
      [:empty_bucket, BUCKET_ONE],
      [:empty_bucket, BUCKET_TWO],
      [:fill_bucket, BUCKET_ONE],
      [:fill_bucket, BUCKET_TWO],
      [:transfer_from_bucket, BUCKET_ONE],
      [:transfer_from_bucket, BUCKET_TWO]
    ]
  end
end
