function charliethefish_display_colors -a color_scheme -d 'Print example prompt color schemes'

  set -l color_schemes default light \
    solarized solarized-light \
    base16 base16-light \
    gruvbox zenburn \
    dracula nord \
    terminal terminal-dark-white \
    terminal-light terminal-light-black \
    terminal2 terminal2-dark-white \
    terminal2-light terminal2-light-black

  switch "$color_scheme"
    case '--all'
      for scheme in $color_schemes
        echo
        echo "$scheme:"
        charliethefish_display_colors $scheme
      end
      return

    case $color_schemes
      __charliethefish_colors $color_scheme

    case ''
      if type -q charliethefish_colors
        if [ -n "$theme_color_scheme" ]
          echo "$theme_color_scheme (with charliethefish_colors overrides):"
        else
          echo 'custom (via charliethefish_colors):'
        end
      else if [ -n "$theme_color_scheme" ]
        echo "$theme_color_scheme:"
      end

      __charliethefish_colors $theme_color_scheme
      type -q charliethefish_colors
        and charliethefish_colors

    case '*'
      echo 'usage: charliethefish_display_colors [--all] [color_scheme]'
      return
  end

  __charliethefish_glyphs

  echo
  set_color normal

  __charliethefish_start_segment $color_initial_segment_exit
  echo -n exit $nonzero_exit_glyph
  set_color -b $color_initial_segment_private
  echo -n private $private_glyph
  set_color -b $color_initial_segment_su
  echo -n su $superuser_glyph
  set_color -b $color_initial_segment_jobs
  echo -n jobs $bg_job_glyph
  __charliethefish_finish_segments
  set_color normal
  echo -n "(<- initial_segment)"
  echo

  __charliethefish_start_segment $color_path
  echo -n /color/path/
  set_color -b $color_path_basename
  echo -ns basename ' '
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_path_nowrite
  echo -n /color/path/nowrite/
  set_color -b $color_path_nowrite_basename
  echo -ns basename ' '
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_path
  echo -n /color/path/
  set_color -b $color_path_basename
  echo -ns basename ' '
  __charliethefish_start_segment $color_repo
  echo -n "$branch_glyph repo $git_stashed_glyph "
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_path
  echo -n /color/path/
  set_color -b $color_path_basename
  echo -ns basename ' '
  __charliethefish_start_segment $color_repo_dirty
  echo -n "$tag_glyph repo_dirty $git_dirty_glyph "
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_path
  echo -n /color/path/
  set_color -b $color_path_basename
  echo -ns basename ' '
  __charliethefish_start_segment $color_repo_staged
  echo -n "$detached_glyph repo_staged $git_staged_glyph "
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_vi_mode_default
  echo -ns vi_mode_default ' '
  __charliethefish_finish_segments
  __charliethefish_start_segment $color_vi_mode_insert
  echo -ns vi_mode_insert ' '
  __charliethefish_finish_segments
  __charliethefish_start_segment $color_vi_mode_visual
  echo -ns vi_mode_visual ' '
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_vagrant
  echo -ns $vagrant_running_glyph ' ' vagrant ' '
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_username
  echo -n username
  set_color normal
  set_color -b $color_hostname[1] $color_hostname[2..-1]
  echo -ns @hostname ' '
  __charliethefish_finish_segments
  echo

  __charliethefish_start_segment $color_rvm
  echo -ns $ruby_glyph rvm ' '
  __charliethefish_finish_segments

  __charliethefish_start_segment $color_virtualfish
  echo -ns $virtualenv_glyph virtualfish ' '
  __charliethefish_finish_segments

  __charliethefish_start_segment $color_virtualgo
  echo -ns $go_glyph virtualgo ' '
  __charliethefish_finish_segments

  __charliethefish_start_segment $color_desk
  echo -ns $desk_glyph desk ' '
  __charliethefish_finish_segments

  __charliethefish_start_segment $color_aws_vault
  echo -ns aws-vault ' (' active ') '
  __charliethefish_finish_segments

  __charliethefish_start_segment $color_aws_vault_expired
  echo -ns aws-vault ' (' expired ') '
  __charliethefish_finish_segments

  echo -e "\n"
end
