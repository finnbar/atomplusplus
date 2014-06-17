local moon = require("moon")
do
  local _base_0 = {
    compare = function(self, comparison)
      if #comparison ~= #self.set then
        return false
      end
      table.sort(comparison)
      table.sort(self.set)
      for i in pairs(comparison) do
        if comparison[i] ~= self.set[i] then
          return false
        end
      end
      return true
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, list, attrs)
      self.set = list
      self.attributes = attrs
    end,
    __base = _base_0,
    __name = "combo"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  combo = _class_0
end
findCombos = function(collection)
  for i = #collection, 2, -1 do
    print(i)
    for a = 1, #combos do
      if #combos[a].set == i then
        for b = 1, (#collection - i) + 1 do
          local t = { }
          for c = 0, i - 1 do
            table.insert(t, collection[b + c])
          end
          local isit = combos[a]:compare(t)
          if isit then
            for q = 1, #t do
              print(t[q], b + q - 1)
            end
          end
        end
      end
    end
  end
end
combos = {
  combo({
    "H",
    "Cl"
  }, {
    "magic"
  }),
  combo({
    "O",
    "Cl"
  }, {
    "magic"
  }),
  combo({
    "H",
    "O"
  }, {
    "magic"
  })
}
do
  local _base_0 = {
    text = function(self, caret)
      local str = ""
      for i = 1, self.position do
        str = str .. self.letters[i]
      end
      if not caret then
        return str
      end
      return tostring(str) .. "█"
    end,
    inc = function(self)
      if self.position < #self.letters then
        self.position = self.position + 1
        return true
      else
        return false
      end
    end
  }
  _base_0.__index = _base_0
  local _class_0 = setmetatable({
    __init = function(self, text)
      self.letters = { }
      for letter in text:gmatch("%Z") do
        if letter ~= "	" then
          table.insert(self.letters, letter)
        else
          table.insert(self.letters, "")
        end
      end
      self.position = 1
    end,
    __base = _base_0,
    __name = "typing"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  typing = _class_0
end
