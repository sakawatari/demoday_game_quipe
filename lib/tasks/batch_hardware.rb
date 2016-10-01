class Tasks::BatchHardware
    def self.execute
        Hardware.create(
            hardware: "ps4",
            maker: "sony"
            )
    end
end