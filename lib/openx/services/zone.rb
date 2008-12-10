module OpenX
  module Services
    class Zone < Base
      # Delivery types
      BANNER        = 'delivery-b'
      INTERSTITIAL  = 'delivery-i'
      TEXT          = 'delivery-t'
      EMAIL         = 'delivery-e'

      # Tag Types
      JAVASCRIPT  = 'adjs'
      LOCAL       = 'local'
      IFRAME      = 'adframe'
      XMLRPC_TAG  = 'xmlrpc'

      openx_accessor :name          => :zoneName,
                     :id            => :zoneId,
                     :width         => :width,
                     :height        => :height,
                     :type          => :type,
                     :publisher_id  => :publisherId

      has_one :publisher

      self.endpoint = '/ZoneXmlRpcService.php'
      self.create   = 'addZone'
      self.update   = 'modifyZone'
      self.delete   = 'deleteZone'
      self.find_one = 'getZone'
      self.find_all = 'getZoneListByPublisherId'

      class << self
        ###
        # Deliver +zone_id+ to +ip_address+ with +cookies+, 
        def deliver zone_id, ip_address = '192.168.1.1', cookies = []
          url = "#{self.configuration['root']}/delivery/axmlrpc.php"
          server = XMLRPC::Client.new2(url)
          server.call('openads.view', {
            'cookies'     => cookies,
            'remote_addr' => ip_address,
          }, "zone:#{zone_id}", 0, '', '', true, [])
        end
      end

      def initialize(params = {})
        raise "need publisher" unless params[:publisher_id] || params[:publisher]
        params[:publisher_id] ||= params[:publisher].id
        super(params)
      end

      # Link this zone to +campaign+
      def link_campaign(campaign)
        raise "Zone must be saved" if new_record?
        raise ArgumentError.new("Campaign must be saved")if campaign.new_record?

        session   = self.class.connection
        server    = XMLRPC::Client.new2("#{session.url}#{self.class.endpoint}")
        server.call("linkCampaign", session.id, self.id, campaign.id)
      end

      # Unlink this zone from +campaign+
      def unlink_campaign(campaign)
        raise "Zone must be saved" if new_record?
        raise ArgumentError.new("Campaign must be saved")if campaign.new_record?

        session   = self.class.connection
        server    = XMLRPC::Client.new2("#{session.url}#{self.class.endpoint}")
        server.call("unlinkCampaign", session.id, self.id, campaign.id)
      end

      # Link this zone to +banner+
      def link_banner(banner)
        raise "Zone must be saved" if new_record?
        raise ArgumentError.new("Banner must be saved")if banner.new_record?

        session   = self.class.connection
        server    = XMLRPC::Client.new2("#{session.url}#{self.class.endpoint}")
        server.call("linkBanner", session.id, self.id, banner.id)
      end

      # Unlink this zone from +banner+
      def unlink_banner(banner)
        raise "Zone must be saved" if new_record?
        raise ArgumentError.new("Banner must be saved")if banner.new_record?

        session   = self.class.connection
        server    = XMLRPC::Client.new2("#{session.url}#{self.class.endpoint}")
        server.call("unlinkBanner", session.id, self.id, banner.id)
      end

      # Generate tags for displaying this zone using +tag_type+
      def generate_tags(tag_type = IFRAME)
        session   = self.class.connection
        server    = XMLRPC::Client.new2("#{session.url}#{self.class.endpoint}")
        server.call("generateTags", session.id, self.id, tag_type, [])
      end
    end
  end
end
