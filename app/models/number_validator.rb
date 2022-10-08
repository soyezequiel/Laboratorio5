class NumberValidator < ApplicationRecord
include HTTParty
base_uri "https://phonevalidation.abstractapi.com/v1/"
    def initialize(tel)
        @tel=tel
    end
    def valid?
        response= self.class.get("/",{
            query:{
                    api_key: Rails.application.credentials.abstractapi_api_key,
                    tel: @tel
            }

        })
        response["valid"]["value"]
    end
end
