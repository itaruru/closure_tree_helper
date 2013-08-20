#
#
#
module ClosureTreeHelper
  #
  #
  #
  module TreeListHelper
    #
    # === Parameters
    # 
    # +nodes+ 
    # +root_tag+
    # +opts+
    #               category_tag:   '<ul>'
    #               inner_tag:      '<li>'
    #               path:           '/tags'
    #               active_class:   'active'
    #               active_id:      params[:id].to_i
    #               active_node_id: :id
    #               link_class:     'link'
    #
    def tree_list(nodes, root_tag='<ul>', opts={})
      opts.merge!({category_tag: '<ul>'}) if opts[:category_tag].blank?
      opts.merge!({inner_tag: '<li>'})    if opts[:inner_tag].blank?

      rtag = root_tag.dup
      list = build_tree_list(nodes, root_tag, opts)
      list << close_tag(rtag)
      list.join
    end

    private

    def build_tree_list(nodes, ret_tag, opts={}) # :nodoc:
      nodes.map do |node, sub_nodes|
        ret_tag << opts[:inner_tag]
        ret_tag << link_to(node.name, "#{opts[:path]}/#{node.id}", build_class(node, opts))
        if sub_nodes.size > 0
          ret_tag << opts[:category_tag]
          build_tree_list(sub_nodes, ret_tag, opts)
          ret_tag << close_tag(opts[:category_tag])
        end
        ret_tag << close_tag(opts[:inner_tag])
        ret_tag
      end
    end

    def build_class(node, opts) # :nodoc:
      c = []
      c << opts[:link_class]
      c << active(node, opts)
      c.compact!
      return nil if c.size < 1
      {class: c.join(' ')}
    end

    def active(node, opts) # :nodoc:
      opts[:active_class] if node.send(opts[:active_node_id]) == opts[:active_id]
    end

    def close_tag(tag) # :nodoc:
      return nil if tag.blank?
      '</' + tag.split(/ /).first.gsub(/(<|>)/, '') + '>'
    end
  end
end
