for i = 1, 100000, 1 do
    redis.call("SET", i.."ZzZ_MYKEY_ZzZ_key", i)
end
