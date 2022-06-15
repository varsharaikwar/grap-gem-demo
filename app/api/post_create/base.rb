module PostCreate
    class Base < Grape::API
     mount PostCreate::V2::Posts
    end
   end