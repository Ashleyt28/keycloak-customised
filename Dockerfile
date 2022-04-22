FROM quay.io/keycloak/keycloak:15.0.1

ARG AUTHENTICATOR_JAR=authenticators/target/authenticators.jar

# copy the jars ...
COPY ${AUTHENTICATOR_JAR} /opt/jboss/keycloak/standalone/deployments/

# theme customisation region

ARG CODELENS_THEME_BASE_DIR=/opt/jboss/keycloak/themes/codelens
ARG ALFRESCO_THEME_BASE_DIR=/opt/jboss/keycloak/themes/alfresco
ARG KEYWIND_THEME_BASE_DIR=/opt/jboss/keycloak/themes/keywind
ARG GENNYBASE_THEME_BASE_DIR=/opt/jboss/keycloak/themes/genny_base

ARG CODELENS_THEME_LOCAL_ROOT_DIR=themes/codelens
ARG ALFRESCO_THEME_LOCAL_ROOT_DIR=themes/alfresco
ARG KEYWIND_THEME_LOCAL_ROOT_DIR=themes/keywind
ARG GENNYBASE_THEME_LOCAL_ROOT_DIR=themes/genny_base

RUN mkdir ${CODELENS_THEME_BASE_DIR}
RUN mkdir ${ALFRESCO_THEME_BASE_DIR}
RUN mkdir ${KEYWIND_THEME_BASE_DIR}


COPY ${CODELENS_THEME_LOCAL_ROOT_DIR} ${CODELENS_THEME_BASE_DIR}
COPY ${ALFRESCO_THEME_LOCAL_ROOT_DIR} ${ALFRESCO_THEME_BASE_DIR}
COPY ${KEYWIND_THEME_LOCAL_ROOT_DIR} ${KEYWIND_THEME_BASE_DIR}
