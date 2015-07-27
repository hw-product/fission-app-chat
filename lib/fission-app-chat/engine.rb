module FissionApp
  module Chat

    class Engine < ::Rails::Engine

      config.to_prepare do |config|

        product = FissionApp.init_product(:chat)
        feature = Fission::Data::Models::ProductFeature.find_or_create(
          :name => 'Chat Access',
          :product_id => product.id
        )
        permission = Fission::Data::Models::Permission.find_or_create(
          :name => 'Chat access',
          :pattern => '/chat.*'
        )
        unless(feature.permissions.include?(permission))
          feature.add_permission(permission)
        end
      end

      # @return [Array<Fission::Data::Models::Product>]
      def fission_product
        [Fission::Data::Models::Product.find_by_internal_name('chat')]
      end

      # @return [Hash] account navigation
      def fission_account_navigation(*_)
        Smash.new('Support' => Rails.application.routes.url_helpers.chat_path)
      end

    end
  end
end
