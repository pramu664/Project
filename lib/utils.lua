utils = {}

function utils.circle_circle(c1, c2)
  dx = c1.position:get_x() - c2.position:get_x()
  dy = c1.position:get_y() - c2.position:get_y()
  distance_between_two_points = math.sqrt(( dx * dx ) + ( dy * dy ))
  return distance_between_two_points < ( c1.radius + c2.radius )
end


function utils.circle_point(circle, point)
  dx = circle.position:get_x() - point.position:get_x()
  dy = circle.position:get_y() - point.position:get_y()
  distance = math.sqrt(dx * dx + dy * dy)
  return distance < circle.radius 
end


function utils.in_range(value, min, max)
  return value >= math.min(min, max) and value <= math.max(max, min)
end

function utils.point_in_rect(x, y, rect)
  return utils.in_range(x, rect.x, rect.x + rect.width) and utils.in_range(y, rect.y, rect.y + rect.height)
end

function utils.range_intersect(min_a, max_a, min_b, max_b)
  return max_a >= min_b and min_a <= max_b
end


function utils.rect_in_rect(r0, r1) 
  return utils.range_intersect(r0.x, r0.x + r0.width, r1.x, r1.x + r1.width)  and
  utils.range_intersect(r0.y, r0.y + r0.height, r1.y, r1.y + r1.width)
end



function utils.circle_rect(circle, rect)

  -- Calculate the closest point on the rectangle to the circle center
  closestX = math.max(rect.x, math.min(circle.x, rect.x + rect.width))
  closestY = math.max(rect.y, math.min(circle.y, rect.y + rect.height))

  -- Calculate the distance between the closest point and the circle center
  distance = math.sqrt(( circle.x - closestX) * ( circle.x - closestX) + ( circle.y - closestY) * ( circle.y - closestY))

  -- check for collision
  return distance <= circle.radius
end

-- new normalization
function utils.normal(min, max, value)
  return value / (max - min)
end


-- new linear interpolation
function utils.lerp(min, max, normal)
  return (max - min) * normal + min
end


return utils
