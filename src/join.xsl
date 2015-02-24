<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes" omit-xml-declaration="no"
		standalone="no" doctype-system="output.dtd" />

	<xsl:variable name="doc2" select="document('artworks.xml')" />




	<xsl:template match="/">

		<xsl:element name="authors">

			<xsl:for-each select="//author">

				<xsl:variable name="temp" select="name/text()" />

				<xsl:copy>


					<xsl:copy-of select="*" />

					<xsl:variable name="output">

						<xsl:call-template name="artworks">

							<xsl:with-param name="authName" select="$temp" />
																						
						</xsl:call-template>

					</xsl:variable>
					
					<xsl:for-each select="$output//artworks">
					
									
						<xsl:if test="child::node()">
										
					
							<xsl:copy-of select="." />
							
						</xsl:if>
						
						
						
					</xsl:for-each>
					
				</xsl:copy>


			</xsl:for-each>


		</xsl:element>

	</xsl:template>

	<xsl:template name="artworks">


		<xsl:param name="authName" />


		<xsl:for-each-group select="$doc2/artworks/artwork"
			group-by="form">

			

			<xsl:element name="artworks">


				<xsl:attribute name="form"><xsl:value-of
					select="current-grouping-key()" /></xsl:attribute>


				<xsl:for-each select="current-group()">

					<xsl:sort select="date" />

					<xsl:if test="author/text() = $authName">
					
						
						
						<xsl:element name="artwork">

							<xsl:attribute name="date"><xsl:value-of
								select="date" /></xsl:attribute>

							<xsl:copy-of select="title"></xsl:copy-of>

							<xsl:copy-of select="technique"></xsl:copy-of>

							<xsl:copy-of select="location"></xsl:copy-of>

						</xsl:element>

					</xsl:if>

					

				</xsl:for-each>

			</xsl:element>
			
			

		</xsl:for-each-group>

	</xsl:template>


</xsl:stylesheet>