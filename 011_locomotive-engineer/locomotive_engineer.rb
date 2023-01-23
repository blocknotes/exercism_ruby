class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons) = wagons

  def self.fix_list_of_wagons(ary1, ary2)
    ary1.delete(1)
    first2 = ary1.shift(2)
    [1, *ary2, *ary1, *first2]
  end

  def self.add_missing_stops(route, **stops)
    route[:stops] = stops.sort.to_h.values
    route
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
