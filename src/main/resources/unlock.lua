--锁的key
local key = KEYS[1]
--当前线程标识
local threadId = ARGV[1]

--获取锁中的线程标识
local id = redis.call('get', key)

if(id == threadId) then
    --释放
    return redis.call('del', key)
end
return 0

