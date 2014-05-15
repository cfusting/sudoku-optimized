import Base.@time

function is_valid(state::Array{Int64,2}, x::Int64, y::Int64)
    for i in 1:9
        if ((i != y && state[x,i] == state[x,y])
           || (i != x && state[i,y] == state[x,y]))
            return false   
        end
    end
    
    x_from = ifloor((x - 1) / 3) * 3 + 1
    y_from = ifloor((y - 1) / 3) * 3 + 1
    return isvalidinner(x_from, y_from, x, y, state)
end

function isvalidinner(x_from::Int64, y_from::Int64, x::Int64, y::Int64, state::Array{Int64,2})
    for xx in x_from:x_from+2
        for yy in y_from:y_from+2
            if (xx != x || yy != y) && state[xx,yy] == state[x,y]
                return false
            end
        end
    end
    return true
end

function next_state(state::Array{Int64,2}, x::Int64, y::Int64) 
    if y == 10
        y = 1
        x = x + 1
    end
    
    if x == 10
        return true
    end
    
    if state[x,y] != 0
        if !is_valid(state, x, y)
            return false
        end
        return next_state(state, x, y + 1)
    else
        for i in 1:9
            state[x,y] = i
            if is_valid(state, x, y) && next_state(state, x, y + 1)
                return true
            end
        end
    end
    
    state[x,y] = 0
    return false
end

board = [
   0 0 0 4 0 5 0 0 1;
   0 7 0 0 0 0 0 3 0;
   0 0 4 0 0 0 9 0 0;
   0 0 3 5 0 4 1 0 0;
   0 0 7 0 0 0 4 0 0;
   0 0 8 9 0 1 0 0 0;
   0 0 9 0 0 0 6 0 0;
   0 8 0 0 0 0 0 2 0;
   4 0 0 2 0 0 0 0 0
]
board_fresh = copy(board)
println(board)
next_state(board, 1, 1)
println(board)
println(board_fresh)
@time next_state(board_fresh, 1, 1)
println(board)
