class SayController < ApplicationController
    def hello
        @time = Time.now
    end

    def goodbye
    end

    def loop

    end

    def files
        @files = Dir.glob('*')
    end
end
