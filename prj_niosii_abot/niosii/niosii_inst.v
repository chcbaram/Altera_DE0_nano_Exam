	niosii u0 (
		.clk_clk                          (<connected-to-clk_clk>),                          //                       clk.clk
		.epcs_flash_dclk                  (<connected-to-epcs_flash_dclk>),                  //                epcs_flash.dclk
		.epcs_flash_sce                   (<connected-to-epcs_flash_sce>),                   //                          .sce
		.epcs_flash_sdo                   (<connected-to-epcs_flash_sdo>),                   //                          .sdo
		.epcs_flash_data0                 (<connected-to-epcs_flash_data0>),                 //                          .data0
		.ip_pwm_dir                       (<connected-to-ip_pwm_dir>),                       //                    ip_pwm.dir
		.ip_pwm_out                       (<connected-to-ip_pwm_out>),                       //                          .out
		.pio_0_external_connection_export (<connected-to-pio_0_external_connection_export>), // pio_0_external_connection.export
		.reset_reset_n                    (<connected-to-reset_reset_n>),                    //                     reset.reset_n
		.uart_0_rxd                       (<connected-to-uart_0_rxd>),                       //                    uart_0.rxd
		.uart_0_txd                       (<connected-to-uart_0_txd>)                        //                          .txd
	);

