module ClosureTreeHelper
  module TreeJsonHelper
    #
    # === Example
    #
    # an controller.
    # 
    #     @tags = Tag.hash_tree
    #
    # call tree_json.
    #
    #     <%= tree_json(@tags) %>
    #
    #     <%= tree_json(@tags, {columns: ['id', 'name', 'created_at']}) %>
    #
    # case Jbuilder
    #
    #     json.data do
    #       json.id 1
    #       json.name 'test'
    #       json.tags tree_json(@tags, {columns: ['id', 'name', 'created_at']})
    #     end
    #
    # === Arguments
    #
    # * <tt>:nodes</tt> - returned objects by ClosureTree#hash_tree method.
    #
    # === Options
    #
    # * <tt>:columns</tt> - select columns. type array, value class is string.
    #
    def tree_json(nodes, opts={})
      build_tree_list_by_tree_json(nodes, opts).first
    end

    private

    def build_tree_list_by_tree_json(nodes, opts={}) # :nodoc:
      nodes.map do |node, sub_nodes|
        _node = if opts[:columns].blank?
          node
        else
          node.attributes.extract!(*opts[:columns])
        end

        {
          node:     _node,
          children: build_tree_list_by_tree_json(sub_nodes, opts).compact
        }
      end
    end
  end
end
