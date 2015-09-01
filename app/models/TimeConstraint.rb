class TimeConstraint
  def matches?(request)
    current = Time.now
    current.hour >= 1 && current.hour < 2
  end
end
